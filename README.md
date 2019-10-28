# Mates Rates T2A2 - Marketplace Project

# MatesRates Documentation
Link to Application published on Heroku 
[Link to Github Repo](https://github.com/BenUlcoq/mates_rates)

## Application Purpose

Between 1961 and 1994, the number of houses in Australia more than doubled from 2.8 million to 6.7 million. [(The Evolution of Australian Home Building)](https://www.architectureanddesign.com.au/features/comment/the-evolution-of-australian-home-building) Due to modern updates and discoveries in building materials and regulations, it is forecast that the amount of renovations needed to be completed on houses built in this time will be rapidly increasing in coming years.  [(Australian Renovation Cost Guide)](https://www.canstar.com.au/home-loans/australian-renovation-cost-guide-not-drill/)

In Australia in 2016, nearly 8.4 million people (62%) of Australians conducted some kind of DIY home renovation. [(Renovation Nation: Home Improvement in Australia)](http://www.roymorgan.com/findings/7102-renovation-nation-home-improvement-in-australia-201701090848) It is a well documented fact that Australians love a Saturday morning trip to Bunnings, with the company reporting revenues in excess of $13.1 billion in  2019.  As such, it can be reasonably concluded that there is substantial demand in the Australian market for access to tools and hardware in order to complete DIY projects and renovations. 

Outside of professional tradespeople, many DIYers wouldn’t need access to this hardware beyond the timeframe of their projects. Yet, of the 8.4 million people who undertook DIY projects, more than 2.2 million (26%) spent more than $5000 on these renovations.  [(Renovation Nation: Home Improvement in Australia)](http://www.roymorgan.com/findings/7102-renovation-nation-home-improvement-in-australia-201701090848)

By having access to the tools and hardware required at a cheap rate, for the duration of a project, Australian DIYers can get more ‘bang for their buck’ when it comes to undertaking renovations.
[Wesfarmers - Bunnings](https://www.wesfarmers.com.au/our-businesses/bunnings)
Although businesses such as Kennards Hire exist to fill this gap, the profit-driven nature of the business means costs of these services can sometimes be high enough that it’s more beneficial for someone to purchase the tool. In instances where people do purchase tools themselves, it is extremely likely that they won’t be using them most of the time, regardless of whether hiring costs made an impact on that decision.

**Mates Rates solves all of these problems at once by providing a platform for tool owners to rent out their hardware to those looking at completing DIY projects.** Tool owners can earn money from hardware that ordinarily would be collecting dust, while DIYers will be able to use tools at a significantly cheaper rate than the options that exist in the market already.

[Leveld](https://getleveld.com/) is an application that already exists with similar functionality, but appears to have a relatively low user count. Widespread adoption is critical to the success of this product and I believe that Leveld has failed to achieve this (so far) due to the fact that the product hasn’t been marketed correctly.

By focusing exclusively on an Australian audience, where DIY is ingrained into the culture, Mates Rates should be able to capitalise on the market and provide an extremely valuable service to Australian DIYers.

---

## Application Description

*Mates Rates* is an application that serves as a platform for users to rent out tools to other users for use in DIY projects. The application provides significant value to both tool owners and tool renters. Tool owners can earn money from their tools which would ordinarily not be receiving much use. Tool renters gain access to the hardware for their job without having to pay extreme prices. 

### Functionality and Features

The application has a number of high-level components that compliment one another to deliver a smooth user experience which allows the users to get the maximum value from the application.

#### MVP Features

##### User Sign-In and Sign-Up
The application allows users to create an account using their email address as a unique identifier. Users are authenticated and authorised for accessing certain information as outlined below.

##### Authentication
Although Users who aren’t signed in can browse and view product listings, the ability to rent tools is restricted to those with an account in order to track user interactions with the application and have information relating to a user should issues arise.

##### Authorisation
Within the application, users can have different roles with appropriate permissions. A Renter is the base role assigned to all accounts. In addition to non-user permissions, they have the ability to rent tools from owners. On top of this, Owners have the ability to list tools that they own as available for rent.  Admins have the ability to manipulate all listings on the site, even if they don’t own the tool.

##### Tool CRUD
The ability to create, read, update and destroy tools is part of the core functionality behind Mates Rates. Without the ability to manipulate tool listings, there is no reason for a user to come to the platform.

##### Rental CRUD
Similarly to the above, the ability to create, read, update and destroy rentals is critical to the Mates Rates functionality. Even if an owner can list a tool, if no one can rent it, there is no reason for either user to access the platform.

##### Rental Pricing and Duration
As one of the goals of the application is to make tool owners easy money, it was important for the tool management system to be worth their while so that their ROI is suitable. As such, the application only allows for daily rentals. If products were able to be rented out at smaller intervals, a tool owner may have to undertake too much work in order to rent out a tool.

##### Product Searching
In order to provide a better experience for users, tools will be able to be searched using keywords. This means that rather than scrolling through a potentially huge list of products, users can narrow down what they see to a specific group of products relevant to their needs.

##### Product Filtering
Working alongside product searching, users will be able to search products using different categories. Tools will be able to be assigned categories during creation or modification.

##### Image Upload
Users and products will be able to have images uploaded to a server and displayed alongside other information. Users will have a profile picture which will aid in verification when transferring tools in person, while tools will have images for Renters to look at before choosing to rent the product.

##### Stripe Payment Processing
In order to handle monetary exchange, a payment processing system has to be implemented. Stripe is extremely powerful, secure and easy to use and served as the perfect starting point for payment processing.

##### Admin dashboard
For site moderation purposes, admins have the ability to manipulate other users listings. A dashboard allows admins to quickly browse listings without bloat. As their purpose for browsing listings is different to a regular user, a different interface is required which is more efficient.

#### Extensible Features

#### Security Deposits
Provides protection for tool Owners.

#### Image Upload Date
By tracking image upload date, we can let a Renter know when an image might be out of date/misleading. Additionally, Owners can be notified that an image needs updating after X amount of time.

#### Custom Rental Periods
Some Owners may like the flexibility that hourly rentals allow - some products are more suited to this system also.

#### Cool-down Periods
Some tools may require minor maintenance after use which only the owner can conduct/the tool had been returned in an unusable state and the issue is being resolved. In order to prevent compounding issues, an owner could specify a cool down period in which a tool can no longer be used.

#### Application Walkthrough/Guide/How-to-Use
Having an application walkthrough would be extremely useful in increasing adoption. An application that is difficult to use is unlikely to garner widespread attention.

#### User/Tool Reviews and Ratings
Once a tool rental has been completed, it would be beneficial for tool owners and renters to be able to review or rate one another and the tools. Other users could then see these reviews before committing to rentals.

#### User/Tool Real Time Locations
Using the user address information more effectively to notify

#### User Messaging - useful for admin edit notices.

#### 








1.2 - High level components

1.3 - Tech Stack - Third Party Features

3.3 - Description of project models in terms of active record associations (relationships)

4.2 - Discuss the database relations to be implemented with reference to ERD.

4.3 - ERD Diagram

6.1 - User Stories - Github Projects 
Unresolved and Extensible Features

6.2 Wireframes

6.3 Planning of tasks

	Sprints Design
		Initial Documentation and Project Set-up - Monday 28/10
		Database Research, Design and Documentation - Tuesday 29/10
		Wire-framing and Design - Wednesday 30/10
		Model/Database TDD - Thursday 31/10 - Saturday 2/11
		Controller TDD - Sunday 3/11 - Monday 4/11
		View TDD - Tuesday 5/11 - Thursday 7/11
		Styling - Friday 8/11
		Documentation Updates - Saturday 9/11
		Complete Project Review - 10/11
		
		
		
		
		

		
		
	
		
	TDD


1.1 ERD represents a normalised database model



Sprints plan







 Identify the problem
	Why is it a problem
	Description of app
		Purpose
		Functionality /features
		Sitemap
		Screenshots
		Target Audience
		Tech Stack
	User Stories
	Wireframes for your app
	ERD Diagram
	High level component descriptions
	Third Party Services
	Model descriptions any relationships
	Database relations to be implemented
	Provide your database schema design
	Description of the way tasks are allocated and tracked in your project
