@chcp 65001

@rem Сборка основной разработческой ИБ. по умолчанию в каталоге build/ib
@call vrunner update-dev --src src/cf %*

@rem Выходные директории и файлы описаны в файле .env
@call vrunner syntax-check

@rem Запуск дымовых тестов
@call vrunner xunit $addRoot/tests/smoke

@rem Конвертация данных allure и вывод отчета
@call allure generate --clean .\out\syntaxCheck\allure .\out\allure\smoke -o .\out\html_report
@call allure open .\out\html_report