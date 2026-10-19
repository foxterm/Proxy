# Proxy

FoxTerm APP 专用网络代理库，支持 SOCKS5 和 HTTP CONNECT 代理协议，基于 libetos 底层实现。

> 本库为 [FoxTerm](https://foxterm.app/) APP 专用核心组件，欢迎下载使用：[https://foxterm.app/](https://foxterm.app/)

## 功能

- **SOCKS5** 代理（RFC 1928），支持用户名密码认证
- **HTTP CONNECT** 隧道代理，支持 Basic 认证
- 可配置超时、网卡绑定

## 环境要求

| 平台 | 最低版本 |
|------|---------|
| iOS  | 17.0    |
| macOS | 14.0   |
| Swift | 5.10   |

## 安装

```ruby
pod 'Proxy', :git => 'https://github.com/foxterm/Proxy.git'
```

### 依赖

- [libetos](https://github.com/foxterm/libetos) — 底层 Socket 实现
- [Extension](https://github.com/foxterm/Extension) — Foundation 扩展

## 使用

```swift
// SOCKS5 代理（无认证）
let proxy = ProxyConfiguration(
    type: .socks5,
    proxyHost: "192.168.1.1",
    proxyPort: 1080
)

// SOCKS5 代理（带认证）
let proxy = ProxyConfiguration(
    type: .socks5,
    proxyHost: "proxy.example.com",
    proxyPort: 1080,
    timeoutMs: 10000,
    auth: .init(user: "user", password: "pass")
)

// HTTP CONNECT 代理
let proxy = ProxyConfiguration(
    type: .http,
    proxyHost: "proxy.example.com",
    proxyPort: 8080
)

// 绑定指定网卡
let proxy = ProxyConfiguration(
    type: .socks5,
    proxyHost: "192.168.1.1",
    proxyPort: 1080,
    ifname: "en0"
)

// 通过代理连接目标主机，返回 Socket fd
let fd = proxy.connect(host: "example.com", port: 22)
```

## 许可证

MIT
