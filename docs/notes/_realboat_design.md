# teensyBoat - Real Boat Mode - Design Notes

Working document. Captures the design thinking around adding a "real boat" operating
mode to teensyBoat: a live filtered state of the vessel derived from actual instrument
inputs over NMEA0183, Seatalk, and NMEA2000, analogous to `boatSimulator` but driven by
the network rather than generating it. UNLINKED from the docs nav chain. Tentative
throughout; pre-implementation.


## North star

Serve a live "boat state" webpage from the existing teensyBoat.pm HTTP server, usable
from a tablet at the helm over local wifi to the laptop at the nav station. The page
shows a Leaflet chartplotter view with the boat on a satellite or nautical base layer,
surrounded by configurable widget panels (gauges, AIS list, autopilot state, source
health, track trail, etc.). Artistic configurability is part of the appeal: themes,
multiple base-layer choices, custom marker styles.

This page is the design pull factor. It is also a useful design constraint: the page's
widget inventory effectively IS the world-model spec. Designing the page is designing
the model.


## Motivation: why this matters now

- Real-boat installation needs a timestamped log. The E80 does not timestamp track
  points, and the boat is moving from desktop test harness toward in-water use.
- The wxPerl app is the natural place to host both the configuration UX (which
  protocols and messages to monitor, which source is preferred per data type) and the
  live web view.
- Coolness factor for demonstrations. A live boat-state webpage is a high-leverage
  artifact for showing what the project is.


## Why this is bigger than "just add a track feature"

A naive plan would be: filter own-ship position from incoming GPS messages and write
points to flash. That works for tracks alone. But a real-boat mode that supports the
webpage and serves as a foundation for future features requires a world model that
extends well past own-ship position. Specifically:

- Multiple sources per data type. The boat may have an NMEA0183 GPS and an NMEA2000
  GPS, two depth sources, two wind sources. The model must decide which is preferred
  at any moment and track per-source health.
- AIS targets. Incoming from the VHF radio over NMEA2000 (and sometimes NMEA0183).
  Not a single value but a fleet of remote vessels, each with its own state (MMSI,
  position, COG, SOG, name, class). There is currently no AIS modeling in the codebase.
- Routes, waypoints, autopilot state. Surfaced over multiple protocols, again with
  format differences.
- Per-protocol decoder hooks. Each of `inst0183`, `instST`, `inst2000` must feed the
  shared world model. Expect cross-cutting changes when this lands.

The single-boat abstraction does not fit. Real-boat state is a world model:
own-ship + AIS targets + routes + waypoints + alarms + source-health.


## Why base-class symmetry with boatSimulator fails

An earlier exploration tried a clean hierarchy: real/sim boats sharing a base,
real/sim instruments sharing a base. This does not survive contact with the level of
detail real-boat mode requires.

- `boatSimulator` is a narrow generator: it produces own-ship state to drive virtual
  instruments. Its job is simple by design.
- Real-boat mode is a world observer with heterogeneous inputs, multiple sources per
  data type, AIS, and protocol-specific quirks. Its job is messy by necessity.
- The two overlap only on the own-ship subset. There is nothing on the sim side that
  corresponds to a fleet of AIS targets or to source-attribution logic.

The right framing is asymmetric: real-boat mode is primary, and `boatSimulator` is one
possible driver of the network it observes (more on this below).


## Cross-protocol reconciliation: the actual hard part

Different protocols expose different subsets of the same concept, with different
shapes. Examples:

- GPS quality. NMEA0183 GGA exposes fix quality, HDOP, satellites used. Seatalk has
  almost nothing useful at this layer. NMEA2000 PGN 129540 (and friends) has
  differently-shaped fields again.
- Wind. True vs. apparent vs. ground-referenced, with different fields and different
  reference frames per protocol.
- Depth. Below transducer vs. below keel vs. below surface, with offsets the user must
  configure.

The canonical model has to be a superset that captures what any single source can
provide, with explicit source attribution and a "is this source trusted right now"
config layer. This is most of the design work, not the storage layer.


## boatSimulator's role: stimulus probe, not sibling

`boatSimulator` is not a parallel data source to the real boat. Its actual role, as
used in practice, is as a stimulus generator that uses the live instrument network as
a cross-protocol translator.

Concretely: inject simulated data into the network in one protocol, observe what
the E80 (and other instruments) bounce back in other protocols. That round-trip is how
cross-protocol behavior gets derived empirically. Bounce-back behavior is asymmetric:

- NMEA2000 in: bounced back as Seatalk fairly broadly.
- NMEA0183 in: bounced back less nicely.
- NMEA2000 in: only a limited subset of PGNs are bounced.
- On the real boat the network is more than just the E80 (AIS from VHF radio, etc.).

Implications for design:

- Real-boat mode is primary; the sim is one possible driver of the same observation
  layer (alongside the actual installed instruments).
- This permits useful hybrid modes for shakedown: real GPS + sim wind, for example,
  to validate wind-driven autopilot logic with the boat on the hard.
- A "local echo" option for sim output (feed directly into the real-boat state
  without round-tripping the network) may be a useful sub-feature but is not the
  primary sim-to-real-boat path.


## Hardware constraints

- Two teensyBoat PCBs exist: one on the desk, one installed on Rhapsody. Both are
  built around Teensy 4.0. Patrick is not redesigning the PCBs.
- A Teensy 4.1 (built-in SD card, optional PSRAM/flash sockets) would be a better fit
  for the storage-heavy parts of this project. Not happening on these boards.
- Adding an external SPI SD card on the 4.0 is pin-tight: SPI0 (11/12/13) collides
  with PWMA/PWMB and UDP_ENABLE; SPI1 collides with Seatalk1; SPI2 is only on the
  bottom pads.
- The GPA socket and the tbESP32 companion are both options for offloading work, but
  Patrick prefers KISS: features that depend only on what is already on the deployed
  boards are preferred. ESP32 dependency is opt-in, not load-bearing.
- Therefore, on-Teensy storage uses `LittleFS_Program` (about 1.8 MB of unused
  internal flash). At ~24-32 bytes per packed track point this is roughly 50-80K
  points, more than enough for a passage.


## Tiered surfacing architecture

The runtime architecture is tiered. The project ordering is full real-boat-mode first;
the tiers describe what runs where once the model exists.

- Tier 1 - always on, Teensy 4.0. Own-ship state filter feeding a track log to
  `LittleFS_Program`. This subset DOES map cleanly onto `boatSimulator`'s state
  shape (lat/lon/time/SOG/COG/wind/depth/etc.), and so this part of the work is
  tractable without first solving the full world-model question. It is the floor:
  always present, recoverable after the fact via the existing binary protocol to
  teensyBoat.pm.

- Tier 2 - primary surfacing target, teensyBoat.pm. When the wxPerl app is running,
  it subscribes to richer binary packets, does heavier archival to disk, and serves
  the live boat-state webpage from its built-in HTTP server. This is the headline UX
  motivator for the whole project.

- Tier 3 - opportunistic, tbESP32. When the ESP32 companion is running and healthy,
  LAN broadcast / heavier logging via UDP. Secondary to tier 2 for LAN surfacing.
  Not load-bearing for the core feature.


## Webpage design intent

Concrete decisions so far:

- Map library: Leaflet. navMate has an existing Leaflet implementation that is the
  reference to follow. When implementation begins, mine that for marker styles,
  projection choices, marine overlays, and general patterns rather than starting
  from a blank page. Find navMate via `C:\base\bat\git_repositories.txt`.

- Tile sources, dual-mode:
  - Online: Google Maps (quality, familiarity).
  - Offline (cruising, out of range): TOS-friendly open-source tiles, pre-cached.
    OpenSeaMap as a marine overlay on OSM is the likely combination.
  - The wx app provides a "cache this region for the upcoming passage" UX so tiles
    are warmed before leaving internet range. `leaflet.offline` and similar plugins
    are the likely tooling.
  - The page indicates which mode is currently active.

- Layout: Leaflet in the center cell of a CSS grid. Configurable widget slots expand
  from the left, right, and top. Each widget enumerates the data it consumes
  (AIS-target list, own-ship gauges, track-trail layer, source-health indicators,
  autopilot state, etc.). The widget inventory IS the world-model spec.

- Artistic configurability: multiple base-layer choices (nautical chart vs. satellite),
  themed CSS (dark night-helm mode), custom marker styles for AIS targets. Leaflet
  supports all of this with little ceremony.

- Deployment: wxPerl HTTP server runs on the laptop at the nav station (serial cable
  to the Teensy). Helm tablet consumes the page over local wifi. No boat-installed
  network infrastructure required.

- OpenCPN integration is deliberately deferred. Native webui first; OpenCPN export
  can come later as a different transport once the world model is proven.


## Open questions and deferred decisions

- World-model schema. What canonical superset of fields covers own-ship, AIS,
  routes, waypoints, alarms? What is the source-attribution and trust-state model
  per field? Driven from the webpage widget inventory.
- AIS modeling from zero. Encoding (multiple PGNs in NMEA2000; AIVDM/AIVDO sentences
  in NMEA0183), target lifecycle (when does a target time out?), persistence (do we
  log AIS history alongside own-ship tracks?).
- Source-preference UX in teensyBoat.pm. How does the user configure which source is
  preferred per data type? Per-source enable/disable? Automatic fallback rules?
- Track point schema and cadence. Fields per point, update rate (per second vs. on
  meaningful state change), wraparound or stop-when-full behavior in flash.
- Track extraction protocol. Extend the existing binary protocol to teensyBoat.pm,
  or add a new packet type for bulk-history transfer.
- Cache-region UX. Rectangle selection, zoom-level set, storage budget per cached
  region. Worth thinking about which tile providers permit caching under their TOS.
- Sim-as-driver vs. sim-as-network-stimulus modes. Both are useful for shakedown.
  How do they coexist with real instruments running concurrently?
- Hybrid testing modes. Real GPS + sim wind, for example, to validate autopilot
  behavior on the hard. Worth designing into the model rather than bolting on.


## Sequencing thoughts (subject to revision)

Likely order of attack once implementation begins, given that this is one big project
rather than several small ones:

1. Sketch the world-model schema from the webpage widget inventory.
2. Define source-attribution and trust-state per field.
3. Add the world-model object on the Teensy. Wire `inst0183`, `instST`, and
   `inst2000` decoders to populate it.
4. Extend the binary protocol to publish world-model updates to teensyBoat.pm.
5. Build the live page (Leaflet, gauges, AIS list, theming) in teensyBoat.pm's
   HTTP server, modeled on navMate's Leaflet code.
6. Add the cache-region UX for offline tiles.
7. Add the on-Teensy track log to `LittleFS_Program`, plus extraction protocol and
   wx-side archival.
8. AIS-specific work (encode/decode, target lifecycle, log persistence).
9. Source-preference UX in teensyBoat.pm.

Tier-1 alone (own-ship track on `LittleFS_Program` only) is a possible smaller
fallback path if the larger project stalls, but is explicitly not the chosen ordering.


## References

- `boatSimulator` library in `C:\src\Arduino\libraries\Boat` - existing own-ship
  state model, the template for the own-ship subset of the world model.
- `inst0183`, `instST`, `inst2000` libraries in the same tree - the decoder hooks
  that need to feed the world model.
- `boatBinary` library in the same tree - the binary protocol to teensyBoat.pm,
  needs extension for world-model publish and track extraction.
- navMate (path via `C:\base\bat\git_repositories.txt`) - existing Leaflet
  implementation used as the model for this project's webpage.
- teensyBoat.pm (path via `C:\base\bat\git_repositories.txt`) - existing wxPerl app
  that already speaks the binary protocol; will host the HTTP server and live page.
