# Solid Steel
A simple game that demonstrates the SOLID principals of Object Oriented Design


### Single Responsibility Principal
A class should have one and only one reason to change, meaning that a class should have only one job.

Make Base classes
  - Mob - Why does it change? When a mob's internal state changes; i.e. it is damaged, or healed.
    - Attrs: str, dex, currentHp, maxHp
    - Interface: warCry, attack, takeDamage, isAlive, getStatus
  - Arena - Why does it change? It changes when a match starts and ends.
    - Attrs: battleStatus[NotStarted, InProgress, Complete]
    - manages combat:
      - determines when:
        - a mob specials: percentile based on str
        - a mob dodges: percentile based on dex
        - a mob regens: percentile based on con
  - Gamekeeper - Why does it change? Changes to reflect User state.

### Open-Closed Principal
Objects or entities should be open for extension, but closed for modification.

Lets make different types of Mobs! Lets modify the constructor of the Mob class to show how we can violate the open-closed principal.
Next we'll not violate this principal another way?

### Liskov Substitution Principal
Let q(x) be a property provable about objects of x of type T. Then q(y) should be provable for objects y of type S where S is a subtype of T.

Got that? Cool, let's move on. Wait, wut? Oh, alright then, lets demonstrate by developing the Arena. The Arena class requires two mobs that will do battle.
"If it looks like a duck, and quacks like a duck, but needs batteries then you probably have the wrong abstraction."
"... if S is a subtype of T, then objects of type T in a program may be replaced with objects of type S without altering any of the desirable properties of that program (e.g. "
So if Mob is a base-type, and Ninja is a subtype of Mob. Then instances of Ninja may be replaced with Mob without altering the program.



### Interface segregation principle
A client should never be forced to implement an interface that it doesn't use or clients shouldn't be forced to depend on methods they do not use.


### Dependency Inversion Principal
Entities must depend on abstractions not on concretions. It states that the high level module must not depend on the low level module, but they should depend on abstractions.

We have a dependency inversion principal violation between Arena (a high-level abstraction) and Mob (a low-level abstraction the Arena depends upon). What the heck? How do we solve this? We need there to be two mobs in the Arena that do battle so that we can play the game. That IS the game.

Create an interface that the Mob class inherits and that the Arena class can reference.
