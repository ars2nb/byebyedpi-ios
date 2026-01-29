# byebyedpi-ios

A Swift-first core that mirrors ByeByeDPI-style command selection and mutation planning for an iOS NetworkExtension app. It exposes structured profiles, command templates, and a CLI preview that can be wired into a real VPN tunnel implementation.

## What's included
- Command selection strategies (safe, balanced, aggressive, randomized).
- Mutation planning (TTL, window size, split count, padding).
- Route policy helpers for full or split tunnel routing.
- CLI preview to inspect the full command line that would be sent to the engine.

## Quick start
```bash
swift run byebyedpi-cli balanced split
```

## Next steps
- Integrate `DpiProfile` and `VpnConfiguration` into a `NEPacketTunnelProvider`.
- Replace the command previews with a real ByeByeDPI engine or native DPI-bypass implementation.
