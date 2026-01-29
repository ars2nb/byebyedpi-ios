# byebyedpi-ios

Прототип библиотеки для iOS, которая повторяет логику подбора команд ByeByeDPI и готовит базовый слой для интеграции VPN-туннеля через `NetworkExtension`.

## Что уже есть
- Каталог пресетов команд (Balanced / Aggressive / Mobile).
- Подбор пресета по сетевым условиям.
- Заготовка интерфейса для управления VPN-туннелем.

## Пример использования
```swift
import ByeByeDPI

let selector = CommandSelector()
let selection = selector.selectPreset(
    environment: .wifi,
    hasPacketLoss: false,
    needsExtraObfuscation: false
)

print(selection.preset.arguments)
```

## Что нужно доделать
- Интеграция с `NetworkExtension` и VPN-провайдером.
- Реальный сбор метрик сети для `NetworkEnvironment`.
- UI для выбора и тестирования профилей.

## Источник вдохновения
Android-реализация: https://github.com/romanvht/ByeByeDPI/tree/master/app/src/main/java/io/github/romanvht/byedpi
