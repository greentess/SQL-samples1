# SQL-samples1
Набор  SQL-запросов для базы данных "Заповедник"


### Постановка задачи: 
- Сотрудник заповедника имеет уникальный код, ФИО, должность, номер телефона и дату приема на работу. Сотрудники распределены по нескольким отделам. Каждый отдел имеет уникальный номер, название и руководителя. Сотрудник не может руководить более чем одним отделом.
- Сам заповедник территориально разделен на несколько зон. Каждая зона заповедника имеет уникальный номер, название и  обслуживается сотрудниками из различных отделов. Один сотрудник не может быть ответственен за более чем одну зону. Однако не все сотрудники будут прикреплены к каким-либо зонам.
- Сотрудником проводится экскурсия для туриста по территории заповедника. Экскурсия характеризуется уникальным номером, ценой и датой экскурсии. Турист имеет уникальный код, ФИО, дату рождения, адрес и телефон. 
- Каждая зона заповедника  содержит в себе объекты трёх категорий: животные, растения и достопримечательности. Объект зоны имеет уникальный код.
- Объект растение характеризуется классом, семейством, родом, видом, датой поступления, возрастом и категорией редкости. 
- Объект достопримечательность имеет название и описание.
- Объект животное характеризуется классом, семейством, отрядом, родом, видом, возрастом, полом, датой поступления и категорией редкости.
- Здоровье каждого животного фиксируется в журнале состояния, который характеризуется уникальным номером записи, датой осмотра, информацией о болезни и общем состоянии.
- Воспроизводство численности животных фиксируется в журнале потомства, который характеризуется уникальным кодом детеныша и приблизительной датой рождения детеныша.

![ERModel](https://github.com/greentess/SQL-samples1/blob/main/ER-model.jpg?raw=true)
![Diag](https://github.com/greentess/SQL-samples1/blob/main/Diagr.png?raw=true)
### Задания: 
- Задание 1.
    - Выбор предметной области и разработка ER-модели.
    - Преобразование ER-модели в реляционную модель.
- Задание 2.
    - Написать и отладить SQL-сценарий создания БД и таблиц для неё.
- Задание 3.
    - Написать и отладить SQL-сценарий, который вставляет по несколько строк в каждую таблицу БД. 
- Задание 4.
    - Написать несколько запросов к БД. Использовать вложенные подзапросы, группировки, итоговые значения, выборки из нескольких таблиц.
- Задание 5.
    - Создать несколько представлений для БД.
- Задание 6.
    - Создать несколько хранимых процедур для БД (в том числе используя запросы с параметрами).
- Задание 7.
    - Создать хранимую процедуру с использованием курсора для БД.
- Задание 8.
    - Создать несколько триггеров для БД.

