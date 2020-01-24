
### Instructions on how to run the app
- `bundle install`
- `rake setup`
- `rackup`

### High Level Description of the Spec
Create a web application that allows users to list spaces they have available
and hire spaces for the night.


### User specifications
- 1)Any signed-up user can list a new space.
- 4)Users can list multiple spaces.
- 2)Users should be able to name their space, provide a short description of the space, and a price per night.
- 3)Users should be able to offer a range of dates where their space is available.
- 5)Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- 6)Nights for which a space has already been booked should not be available for users to book that space.
- 7)Until a user has confirmed a booking request, that space can still be booked for that night.

### User stories
```
1)Any signed-up user can list a new space.:
  As a user with empty spaces
  So that I can earn extra income from an empty space
  I would like to list the space on MakersBnB
  -->Person A and B
```
```
2)Users should be able to name their space, provide a short description of the space, and a price per night.
  As a user with empty spaces
  So that my listings are informative and attractive to other users
  I would like add a name, a description and a price per night
```

```
3)Users should be able to offer a range of dates where their space is available.
  As a user with empty spaces
  So that my spaces will avoid double bookings
  I would like declare date range when my spaces are available for bookings
```

```
5)Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
  As a user without a bed
  So that I don't have to sleep outside
  I would like request to book a space for the night
```

```
5)Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
  As a user with empty spaces
  So that only users who I want to stay in my space stay in my space
  I would like to approve a booking request
```

```
6) Nights for which a space has already been booked should not be available for users to book that space.
  As a user with empty spaces
  So that my spaces will avoid double bookings
  I would like to show a space that is already booked as unavailable
```

```
7)Until a user has confirmed a booking request, that space can still be booked for that night.
  As a user with empty spaces
  So that I will not miss out on any bookings
  I would like to list spaces, that are reserved but not confirmed, as available
```

```
1)Any signed-up user can list a new space.:
  As a user with empty spaces
  So that I can make sure only I earn income from my spaces
  I would like to register for MakersBnB
```

```
4)Users can list multiple spaces.
  As a user with empty spaces
  So that I can earn money from all my empty spaces
  I would like to list multiple spaces on MakersBnB
```
