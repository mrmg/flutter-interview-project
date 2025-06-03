# Tasks

1. Refactor main.dart to isolate the business logic from the UI using a design pattern of your choosing. The separated business logic should be unit tested.
I considered using Bloc pattern for this but I felt as what we were working with was fairly simple I decided to go with Riverpod for state management using a repository and provider pattern. The business logic for loading and managing market data is now handled in a dedicated provider (marketProviderProvider), which separates it from the UI code. The UI (MarketListScreen) consumes this provider, ensuring a clear separation of concerns and improved testability. This approach also makes it easier to maintain and extend the app in the future.

2. After completing the first task, what would you choose to do next? In this task we would like to see which would be your next priority and why.
I did do a little code refactoring prior to Task 1 as felt it helps separate things to make them more digestable and organised. In terms of what I'd approach next, currently we're only loading from static data, I would probably look to update this to some live data and implement caching of the data along with polling for updates (or receiving updated data in via a stream).

3. If you had more time what would you improve?
I'd like to look at adding some simple animations, first to indicate loading as we'd no longer be pulling data from a local file, then also some very subtle animations as elements come in giving a good experience to the user. It could also be nice to expand the data we show, either with a new screen or an expanding widget.