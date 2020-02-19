# NY Times Best Sellers App

## Contributors

[Howard Chang](https://github.com/howardC56)

[Chelsi Christmas](https://github.com/chelsichristmas)

[Lilia Yudina](https://github.com/yudinal)

[Ameni Alsaydi](https://github.com/AmeniAlsaydi)

## Description

Looking for a great read but tired of searching for a good book one by one? No doubt, the process can be exhausting. However, no need to do this anymore, with the New York Times Best Sellers App you can easily sort through thousands of bestselling books in one click. By choosing your favorite category, you can set up the app to always look for your favorite books first as soon as you open the app. Once you're done and want to switch to a new category, you can easily do that by switching it up in the settings. You can delete all your previous books and start saving a fresh set of all your favorites all over again. So, don't waist your time anymore skimming through myriads of titles, we'll do it for you!

<br />

![gif](Gifs/gifpart1.gif)  ![gif](Gifs/gifpart2.gif)

<br />
## Application Program Service (API)
**The two API’s that were used for this app are:** 
- NYT API
- NYT Book List API

The NYT API was used to access the best selling books for eaah category and the book's information. <br />
The NYT Book List API was used to access categories.

Each API required an APIKey that was retrieved from [here.](https://developer.nytimes.com) <br />


**How To Use:** <br />

Endpoint NYT: Best Sellers for a category
```swift
https://api.nytimes.com/svc/books/v3/lists/current/business books.json?api-key=\(key)
```
Endpoint NYT_ListofBooks: 
```swift
https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)
```

## Used in App
- Safari web API
- Dependency injection
- Data persistance using File manager and User Defaults 
- Restful API
- Core Animations
- [Swift packages](https://github.com/alexpaul/ImageKit) (Shout out to Alex!)

