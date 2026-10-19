# Proxy

[English](README.md) | [中文文档](README_CN.md)

A dedicated network proxy library for FoxTerm APP, supporting SOCKS5 and HTTP CONNECT proxy protocols, built on the libetos底层 implementation.

> This library is a dedicated core component for the [FoxTerm](https://foxterm.app/) APP. Welcome to download: [https://foxterm.app/](https://foxterm.app/)

## Features

- **SOCKS5** proxy (RFC 1928) with username/password authentication
- **HTTP CONNECT** tunnel proxy with Basic authentication
- Configurable timeout and network interface binding

## Requirements

| Platform | Minimum Version |
|----------|----------------|
| iOS      | 17.0           |
| macOS    | 14.0           |
| Swift    | 5.10           |

## Installation

```ruby
pod 'Proxy', :git => 'https://github.com/foxterm/Proxy.git'
```

### Dependencies

- [libetos](https://github.com/foxterm/libetos) — Low-level socket implementation
- [Extension](https://github.com/foxterm/Extension) — Foundation extensions

## Usage

```swift
// SOCKS5 proxy (no authentication)
let proxy = ProxyConfiguration(
    type: .socks5,
    proxyHost: "192.168.1.1",
    proxyPort: 1080
)

// SOCKS5 proxy (with authentication)
let proxy = ProxyConfiguration(
    type: .socks5,
    proxyHost: "proxy.example.com",
    proxyPort: 1080,
    timeoutMs: 10000,
    auth: .init(user: "user", password: "pass")
)

// HTTP CONNECT proxy
let proxy = ProxyConfiguration(
    type: .http,
    proxyHost: "proxy.example.com",
    proxyPort: 8080
)

// Bind to a specific network interface
let proxy = ProxyConfiguration(
    type: .socks5,
    proxyHost: "192.168.1.1",
    proxyPort: 1080,
    ifname: "en0"
)

// Connect to target host through proxy, returns Socket fd
let fd = proxy.connect(host: "example.com", port: 22)
```

## License

MIT
