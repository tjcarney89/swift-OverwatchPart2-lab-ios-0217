# Overwatch - Part II

![](http://i.imgur.com/74DZo1d.png)

[Overwatch](https://en.wikipedia.org/wiki/Overwatch_(video_game)) is a team-based multiplayer first-person shooter video game developed and published by Blizzard Entertainment. It was released in May 2016 for Microsoft Windows, PlayStation 4, and Xbox One.

---

**We will be creating the UI portion of the application here.**

### Demo of App (what you will be building):

[![](http://img.youtube.com/vi/ovruPWmiXeI/0.jpg)](https://www.youtube.com/watch?v=ovruPWmiXeI "Overwatch Demo")

# Instructions

Create a `SelectionViewController.swift` file which will subclass `UIViewController`.

Now head on over to the `Main.storyboard` file. The custom class of the View Controller should be set to your `SelectionViewController`.

Setup your `View` to look like this. It consists of a `UIView`, ` UILabel`, `UISegmentedControl` and a `UIScrollView`.

![](https://s3.amazonaws.com/learn-verified/OWLayout.png)

Add constraints on those view objects so that way it looks like the screenshot above. Here's how I have my views setup:

![](https://s3.amazonaws.com/learn-verified/OWviewLayout.png)

Notice how in the screenshot, it appears that there's only a `UIScrollView` in place there, but I actually have a `UIView` in that exact spot. So the `UIView` is acting as this container view (hence the name I gave it) and within that `UIView` is a `UIScrollView` where the `UIScrollView` has its edges pinned to this container view.

You might notice one other thing which is your next step. The `UIScrollView` has one subview. A `UIStackView`. So add a `UIStackView` to your scroll view and pin it to the edges of the `UIScrollView`. As far as the `UIStackView`'s height and width you should have it equal the height and width of the container view. For now there will be no views placed in this `UIStackView`.

Create the following outlets from your view objects to the `SelectionViewController`:

```swift
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
```

Next, add a stored property called `game` of type `Game` and assign it a value initializing a `Game()`.

Next, create a stored property called `heroType` of type `HeroType!`. Within this stored property you should have a `didSet` observer. Within the `didSet` observer you should assign a new value to the `heroType` property on `game` (`game.heroType`). The value you should assign to `game.heroType` is the `heroType` stored property.

Override the `viewWillAppear(_:)` method. In that method you should assign the `.offense` value to the `heroType` stored property.

Have your `SelectionViewController` adopt the `UIScrollViewDelegate`. For now, we won't implement any functions with regards to the `UIScrollViewDelegate`. If you want, feel free to option click the `UIScrollViewDelegate` type to see what methods are available to you to implement.

Head on over to the `viewDidLoad()` function. The `heroScrollView` stored property has a property itself called `delegate`. If we want to assign a value to this property, it needs to be of type `UIScrollViewDelegate`. And ... considering we just made any instance of `SelectionViewController` adopt this protocol, we can assign `self` (`self` being the current instance of type `SelectionViewController)` to this `delegate` property.

Head back over to the `Main.storyboard` file. Create an `IBAction` from the `UISegmentedControl` object you made. Name the function `changeInHeroType` and change the type to `UISegmentedControl`. In your implementation of this function you should figure out what option the user has selected and based upon that option selected.. you should update the `heroType` stored property. Meaning, if the user selected the Offense option (from the segmented control object), you should assign the value `.offense` to the `heroType` stored property.

---

Now for the fun part.

![](http://i.imgur.com/B7eFmF5.jpg?1)

Create a function called `updateStackViewWithHeroes()`. This function will take in no arguments and return nothing. Ultimately you need to figure out a way for the user to be able to select the various options available to them (from the segmented control) and then update the `UIScrollView` to showcase the heroes from that selected option, like so:

[![](http://img.youtube.com/vi/ovruPWmiXeI/0.jpg)](https://www.youtube.com/watch?v=ovruPWmiXeI "Overwatch Demo")

When the user selects an option (offense, defense, etc.), the scroll view updates which allows the user to scroll through that list of heroes horizontally. From the demo, you should also notice that the `UILabel` at the top updates to display the name of the hero that is currently being displayed in the scroll view.

Head back up to the `heroType` stored property you created above. Within the `didSet` observer you added (below where you have `game.heroType = heroType`), you should call on the `updateStackViewWithHeroes()` function.


**Feel free to make an attempt at doing this without looking at the hints**.


Some hints:

* `UIImageView`'s are `UIView`'s in that they sublcass `UIView`. All methods available to `UIView` are available to a `UIImageView`.
* To remove a `UIView` object entirely, you have to call `removeFromSuperView()` on it.
* A `UIStackView` can remove views from itself by calling `removeArrangedSubview(_:)`.
* The `game` stored property has a `heroes` property which will return back an array of heroes, [`Hero`].
* We can update the `constant` property on `characterStackViewWidthConstraint` to anything we want (wink wink).
* We can programmatically create instances of `UIImageView` and give it a `UIImage` to display in the process (through one of its `init` functions). 
* We can add `UIView`s (or `UIImageViews`) to `UIStackView`s through the `addArrangedSubview(_:)` function available to all instances of `UIStackView`.

Some other hints:
* Being a `UIScrollViewDelegate`, we can implement certain methods that the `heroScrollView` can call on (in that `self` is now the delegate). Look through some of the methods we can implement by option clicking `UIScrollViewDelegate`. The one I used here was `scrollViewDidEndDecelerating(_:)`. Within that method I'm doing some math to see where the person has scrolled to. Doing some more math to grab that hero from the `game.heroes` array. After doing that, I'm updating the label with that information. This is good to put in a separate method.