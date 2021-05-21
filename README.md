## URL shortener app


URL shortening is a technique on the World Wide Web in which a Uniform Resource Locator (URL) may be made substantially shorter and still direct to the required page. This is achieved by using a redirect which links to the web page that has a long URL.

The user only has to copy the full URL of a website and paste it into the URL shortening tool to come up with an abbreviated version that is around 28 characters long.

Example:

Regular URL - http://www.nytimes.com/2012/08/09/us/more-casinos-and-internet-gambling-threaten-shakopee-tribe.html?_r=1&hp

Shortened URL - http://localhos:3000/P7eg6B

Shortened URL then redirects to the original URL.

The app also keeps track of the number of redirects. In a future version will keep track of the time when a link was clicked.

### Description

The home page has an input field where the user can paste or type the URL to be shortened. After clicking the **Shorten** button the app does some basic checking if the URL is valid. If it is, it creates a 6 character slug which then saves to the DB. 

The user is transferred to the next page where he can click a button to copy her shortened link to the clipboard. There is another button if she wants to shorten another URL.

### How I did it

There is one table to save the original and shortened links and the times a link was used.
There are two views. One to get the long link and the second to display the shortened one.

I use Stimulus to add two extra capabilities. One is to count how many characters the shortened URL is shorter than the original and the second is to activate the copy link button. 

Also installed RSpec and Capybara to write model and feature tests. 

I didn't do any styling since it was not in the requirements.

👤 **Author**

- Github: [@macnick](https://github.com/macnick)
- Twitter: [@mac_experts](https://twitter.com/mac_experts)
- Linkedin: [Nick Haralampopoulos](https://www.linkedin.com/in/nick-haralampopoulos-26a55412a/)
