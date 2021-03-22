@chcp 65001

@rem обновление конфигурации основной разработческой ИБ из хранилища. для включения раскомментируйте код ниже
call vrunner loadrepo --storage-name "C:/Users/Maxim Samokhval/Documents/development/OnesRepo/smoke_tests" --storage-user demo --storage-pwd demo
call vrunner updatedb 

@rem Очистка старых результатов тестов allure
del .\out\allure\smoke\*.json

@rem Очистка старых результатов тестов JUnit
del .\out\smoke\*.xml

@rem Выходные директории и файлы описаны в файле .env
@call vrunner syntax-check