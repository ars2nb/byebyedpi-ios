import Foundation

struct Strategy: Identifiable {
    let id: String
    let title: String
    let detail: String

    static let all: [Strategy] = [
        Strategy(
            id: "sequential",
            title: "Последовательный перебор",
            detail: "Пробует команды по очереди, пока не найдёт рабочую."
        ),
        Strategy(
            id: "random",
            title: "Случайный перебор",
            detail: "Перемешивает команды перед подбором."
        ),
        Strategy(
            id: "weighted",
            title: "Приоритетный перебор",
            detail: "Начинает с самых частых комбинаций, затем идёт дальше."
        )
    ]

    static let defaultStrategy = Strategy.all[0]
}
