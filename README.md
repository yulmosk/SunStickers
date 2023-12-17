<img src="assets/images/profile_pic.png" align="right" />

# Стикеры
Учебный Flutter проект.
В ветке main реализована верстка нескольких экранов. 
Верстку предлагается использовать как тренажер для освоения и отработки нюансов бизнес логики.
<br/>
<br/>
<br/>
Бизнес логику будем реализовывать следующими средствами:

<table>
<tr>
<td>
<a href="#banner"><img align="left" src="assets/images/dinosaur.png" width="190" style="margin-bottom:100px; margin-right:20px;"></a>
</td>
<td>
<h3>План:</h3>
<ul>
    <li>Без использования дополнительных библиотек</li>
    <li>Бизнес логика на GetX</li>
    <li>Бизнес логика на BLoC</li>
    <li>Бизнес логика на Cubit</li>
    <li>Бизнес логика на MobX</li>
    <li>Бизнес логика на Redux</li>
    <li>Бизнес логика на Provider</li>
    <li>Бизнес логика на Riverpod</li>
</ul>
<img width="1000" height="0">
<br/>
</td>
</tr>
</table>

:bulb:  :star:
Описание основных веток:

## Ветка :mag_right: main

- [Учебник](https://yulmosk.github.io/SunStickers/tutorials/Stickers.pdf) - В учебнике пошагово рассмотренно создание верстки проекта. В главе 8 учебника бизнес логика приложения реализована без дополнительных библиотек.
<details>
    <summary> Agnostic Obsession </summary>

### Agnostic Obsession

Agnostic obsession is a design approach that focuses on creating software unrelated to any specific domain, application, or technology. Some strategies adopted in this project are related to particular principles, such as the **domain-centric** to support the business (**Reactive DDD** and **Clean Architecture**); **Event Sourcing** + **object-relational mapping** (ORM) for persistence mechanism; **Containers** for immutable environments; and **Kubernetes** (K8s) for cloud deployment.

The **domain-centric** approach is a design pattern that separates the core business logic of an application from other concerns, such as the user interface or infrastructure, making it easier to maintain and extend the application, as the core domain is isolated from other system components. Additionally, the ability to move the core domain to different applications while **keeping the essence of the business** can be helpful for organizations that need to support multiple applications or platforms.

A key aspect of agnostic obsession is **event-sourcing** and **object-relational mapping** (ORM) as a persistence mechanism. Event sourcing involves storing the history of events occurring within a system rather than the system's current state, **avoiding advanced database capabilities such as Joins, Triggers, Procedures, and more**. On the other hand, ORM is a technique that maps objects in a program to data stored in a database, making it easier and more abstract to manage data.

Another essential aspect of agnostic obsession is using **containers to create immutable environments**. Containers are a lightweight virtualization form that allows packaging an application and its dependencies into a single, self-contained unit, making it easy to deploy and run the application in any environment without worrying about the underlying infrastructure or platform.

Finally, agnostic obsession often involves using **Kubernetes** (K8s) for cloud deployment. K8s is an open-source platform for managing and deploying containerized applications. It is widely used in the industry and supported by most cloud providers, making it a natural choice for agnostic obsession.

In summary, agnostic obsession is a powerful approach that allows for creating highly flexible and adaptable software that can be easily moved and deployed in different environments. Using event-sourcing, ORM, Containers, and K8s, it is possible to build resilient, scalable, and easy-to-maintain systems.

</details>

## Ветка state_structure_stateless