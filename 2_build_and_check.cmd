@chcp 65001

@rem Обновление основной разработческой ИБ из исходников. по умолчанию в каталоге build/ib
@call vrunner update-dev --src src/cf %*

@rem Очистка старых результатов тестов allure
del .\out\allure\smoke\*.json

@rem Очистка старых результатов тестов JUnit
del .\out\smoke\*.xml

@rem Выходные директории и файлы описаны в файле .env
@call vrunner syntax-check

@rem Запуск дымовых тестов
@call vrunner xunit $addRoot/tests/smoke

@rem Конвертация данных allure и вывод отчета
@call allure generate --clean .\out\syntaxCheck\allure .\out\allure\smoke -o .\out\html_report
@call allure open .\out\html_report