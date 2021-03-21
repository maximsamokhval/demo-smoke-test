@chcp 65001

@rem Обновление основной разработческой ИБ из исходников. по умолчанию в каталоге build/ib
rem @call vrunner update-dev --src src/cf %*

@rem обновление конфигурации основной разработческой ИБ из хранилища. для включения раскомментируйте код ниже
call vrunner loadrepo --storage-name "C:/Users/Maxim Samokhval/Documents/development/OnesRepo/smoke_tests" --storage-user demo --storage-pwd demo
call vrunner updatedb 

@rem Очистка старых результатов тестов allure
del .\out\allure\smoke\*.json

@rem Очистка старых результатов тестов JUnit
del .\out\smoke\*.xml

@rem Выходные директории и файлы описаны в файле .env
@call vrunner syntax-checker 

@rem Запуск дымовых тестов
@call vrunner xunit $addRoot/tests/smoke

@rem Конвертация данных allure и вывод отчета
@call allure generate --clean .\out\syntaxCheck\allure .\out\allure\smoke -o .\out\html_report
@call allure open .\out\html_report