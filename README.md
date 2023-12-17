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

###:bulb:  ###:star: ###:classical_building: ###:mag_right:  ###:test_tube: ###:toolbox:

<br/>
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

```csharp
[Fact]
public void CreateCartShouldRaiseCartCreated()
    => Given<ShoppingCart>()
        .When<Command.CreateCart>(new(_cartId, _customerId))
        .Then<DomainEvent.CartCreated>(
            @event => @event.CartId.Should().Be(_cartId),
            @event => @event.CustomerId.Should().Be(_customerId),
            @event => @event.Status.Should().Be(CartStatus.Active));
```


> CQRS stands for Command and Query Responsibility Segregation, a pattern that separates read and update operations for a data store. Implementing CQRS in your application can maximize its
> performance, scalability, and security. The flexibility created by migrating to CQRS allows a system to better evolve over time and prevents update commands from causing merge conflicts at the
> domain level.
>
> Benefits of CQRS include:
>
> - **Independent scaling**. CQRS allows the read and write workloads to scale independently, and may result in fewer lock contentions.
> - **Optimized data schemas**. The read side can use a schema that is optimized for queries, while the write side uses a schema that is optimized for updates.
> - **Security**. It's easier to ensure that only the right domain entities are performing writes on the data.
> - **Separation of concerns**. Segregating the read and write sides can result in models that are more maintainable and flexible. Most of the complex business logic goes into the write model. The
    > read model can be relatively simple.
> - **Simpler queries**. By storing a materialized view in the read database, the application can avoid complex joins when querying.
>
</details>

## Ветка state_structure_stateless