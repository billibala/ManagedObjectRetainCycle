# ManagedObjectRetainCycle
An example of how strong reference cycle happens in Core Data managed objects relationship.

## Seed test data
- Open the workspace file from Xcode
- Run the project
- Click `Seed Data` button to seed some test data into the database.
- Quit the app (to avoid any lingering managed objects from the seeding process)

## Transverse unidirectionally
- Run the project again
- From the sample app window, click `Transverse a project` button
- In Xcode, click the `Debug Memory Graph` button from debug toolbar
- Try searching for any `todo` object using the `Filter` at the bottom left of the window.

Expectation: only 1 todo object remains. No extra ones.

## Transverse bi-directionally
- Run the project
- From the sample app window, click `Transverse and Invoke Parent`
- In Xcode, click the `Debug Memory Graph` button from debug toolbar
- Try searching for any `todo` object using the `Filter` at the bottom left of the window.

Expectation: Lots of todo object persisting in memory.
