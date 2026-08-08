# OnePlus 15 Slider HBM Unlock

一加 15 系统亮度滑块激发亮度解锁模块。

## 当前版本

- 模块名称：`OnePlus 15 Slider HBM Unlock`
- 版本：`1.5`（`versionCode=150`）
- 作者：傻瓜我爱你呀喵
- 适配机型：OnePlus 15 各版本

## 功能

- 保留 ColorOS 原生亮度滑块，滑块调到哪里，屏幕就跟随到哪里，不会刷入后强制常亮或直接写死最大值。
- 挂载完整的原厂亮度曲线，将系统逻辑上限从 `4095` 扩展到 `4674`。
- 滑块最大逻辑值通过原厂 Apollo 曲线映射到面板背光码 `DBV 4094`；原厂曲线该段标注为 `1800 nit`。
- 关闭 FOSS、Expressiveness、UIR 等前台应用降亮策略，并将窗口亮度限制提升到原厂曲线的 `1800 nit` 档位，让应用尽量跟随系统滑块。

## 重要说明

`4094` 是面板背光码（DBV），不是 `4094 nit` 的实际亮度。最终亮度仍会受屏幕面板、温度、功耗、HDR、内容和 ColorOS 热保护影响；部分场景出现亮度差异属于系统保护范围。

模块不写入 `screen_brightness`、`max_brightness`、`hbm` 或 `hbm_max`，没有 Action 强制拉满功能。

## 兼容性

安装器只检查 OnePlus 15 机型属性：`PLK110`、`OP60FFL1` 或属性中包含 `OnePlus 15`。不使用显示配置 SHA-256 白名单，因此同一机型的不同系统版本可以尝试安装；其他机型不会安装。

## 安装

1. 从 [Releases](https://github.com/AaTempSpoof/oneplus15-brightness-unlock/releases/latest) 下载 `一加15解锁激发亮度_v1.5.zip`。
2. 在 KernelSU 或兼容的 Root 模块管理器中刷入 ZIP。
3. 重启一次设备，然后调节系统亮度滑块验证。

卸载模块并重启即可恢复系统原始亮度范围。

## 校验

```text
SHA-256: db1491299fdbd65f7a529c198fad5ae15a1c05be2cf1af4493afe139eacf9aea
```

完整校验记录见 [`SHA256SUMS`](SHA256SUMS)。源码位于 [`源码/一加15解锁激发亮度_v1.5`](源码/一加15解锁激发亮度_v1.5)。
