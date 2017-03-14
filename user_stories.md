Nouns in the User Stories
* User
* Customer
* Person
* Bike
* Docking station

Verbs in the User Stories
* Find the surname
* Release a bike
* Use a bike
* Bike is working?

| **Objects** | **Messages** |
|----------------------------|
| User            |                 |
| Customer        | find_by_surname |
| Person          | use_a_bike      |
| Bike            | working?        |
| DockingStation  | release_bike    |

<!--Bike receives the message working? and returns true/false  -->
Bike <-- working? --> true/false

<!--Docking station receives the message to release a bike and returns a bike -->
DockingStation <-- relsease_bike --> a Bike
