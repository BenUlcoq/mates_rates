# Mates Rates
## T2A2 - Marketplace Project
---

# Documentation


Link to Application published on Heroku 

[Link to Github Repo](https://github.com/BenUlcoq/mates_rates)

# Application Purpose
This application has been developed as part of the requirements of T2A2 at Coder Academy in Brisbane. The assignment involved the development of a two-sided marketplace platform as a way of demonstrating ability to design and develop an application from the ground up, through to deployment. Part of the requirements for this assignment involved solving some kind of problem that exists in the world today.

Between 1961 and 1994, the number of houses in Australia more than doubled from 2.8 million to 6.7 million. [(The Evolution of Australian Home Building)](https://www.architectureanddesign.com.au/features/comment/the-evolution-of-australian-home-building) Due to modern updates and discoveries in building materials and regulations, it is forecast that the amount of renovations needed to be completed on houses built in this time will be rapidly increasing in coming years.  [(Australian Renovation Cost Guide)](https://www.canstar.com.au/home-loans/australian-renovation-cost-guide-not-drill/)

In Australia in 2016, nearly 8.4 million people (62%) of Australians conducted some kind of DIY home renovation. [(Renovation Nation: Home Improvement in Australia)](http://www.roymorgan.com/findings/7102-renovation-nation-home-improvement-in-australia-201701090848) It is a well documented fact that Australians love a Saturday morning trip to Bunnings, with the company reporting revenues in excess of $13.1 billion in  2019.  As such, it can be reasonably concluded that there is substantial demand in the Australian market for access to tools and hardware in order to complete DIY projects and renovations. 

Outside of professional tradespeople, many DIYers wouldn’t need access to this hardware beyond the timeframe of their projects. Yet, of the 8.4 million people who undertook DIY projects, more than 2.2 million (26%) spent more than $5000 on these renovations.  [(Renovation Nation: Home Improvement in Australia)](http://www.roymorgan.com/findings/7102-renovation-nation-home-improvement-in-australia-201701090848)

By having access to the tools and hardware required at a cheap rate, for the duration of a project, Australian DIYers can get more ‘bang for their buck’ when it comes to undertaking renovations.
[Wesfarmers - Bunnings](https://www.wesfarmers.com.au/our-businesses/bunnings)
Although businesses such as Kennards Hire exist to fill this gap, the profit-driven nature of the business means costs of these services can sometimes be high enough that it’s more beneficial for someone to purchase the tool. In instances where people do purchase tools themselves, it is extremely likely that they won’t be using them most of the time, regardless of whether hiring costs made an impact on that decision.

*Mates Rates* solves all of these problems at once by providing a platform for tool owners to rent out their hardware to those looking at completing DIY projects. Tool owners can earn money from hardware that ordinarily would be collecting dust, while DIYers will be able to use tools at a significantly cheaper rate than the options that exist in the market already.

[Leveld](https://getleveld.com/) is an application that already exists with similar functionality, but appears to have a relatively low user count. Widespread adoption is critical to the success of this product and I believe that Leveld has failed to achieve this (so far) due to the fact that the product hasn’t been marketed correctly.

By focusing exclusively on an Australian audience, where DIY is ingrained into the culture, Mates Rates should be able to capitalise on the market and provide an extremely valuable service to Australian DIYers.

---

# Application Description
*Mates Rates* is an application that serves as a platform for users to rent out tools to other users for use in DIY projects. The application provides significant value to both tool owners and tool renters. Tool owners can earn money from their tools which would ordinarily not be receiving much use. Tool renters gain access to the hardware for their job without having to pay extreme prices. 

## Functionality and Features
The application has a number of high-level components that compliment one another to deliver a smooth user experience which allows the users to get the maximum value from the application.

### MVP Features

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

### Extensibility

#### Insurance and Legal Research
Providing a platform for tool rental is valuable to users, but without proper channels for users to report and record issues that they may have (such as stolen tools), the application should not be developed beyond the scope of this assignment. In the event that this does happen, additional authorisation would be required on sign-up for different users depending on what is required.

### Extensible Features

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
Using the user address information more effectively to notify users of an approximate location and distance for pick-up or delivery of a tool would allow them to make more informed decisions about the tools they want to hire.

#### User Messaging
User messaging would facilitate the organisation of rentals by allowing Owners and Renters to communicate in real-time, without the need to use third-party applications.

## Tech Stack
#### Ruby on Rails
**[Rails Version: 5.2.3](https://guides.rubyonrails.org/v5.2/getting_started.html)**
**[Ruby Version: 2.6.4](https://ruby-doc.org/stdlib-2.6.4/)**
Ruby on Rails (Rails) is a web application framework built using the Ruby programming language. Rails uses what is known as the Model-View-Controller (MVC) software architecture pattern. The MVC structure breaks code down into individual pieces to maintain separation of concerns. The model stores our data, the view displays it and the controller connects the two and contains most of the logic in an application. 

Within Rails, there are a number of different pieces that were used to handle certain parts of the application.

#### PostgreSQL
**[PostgreSQL version: 10.10](https://www.postgresql.org/docs/10/index.html)**
An object-relational database system based on the SQL language, PostgreSQL was selected for **database management.**

#### Ruby Gems
The Ruby language (and by extension, Rails) uses Gems as a way of easily using preexisting code to implement certain functionality within an application. Rails uses a whole host of Gems  by default, below is a list of Gems installed in addition to the defaults to assist with the development of *Mates Rates*.

###### List of Gems
1. **Bundler**
[Bundler](https://bundler.io/) is a **Gem management system** that allows for quick and easy management of other Gems, including installation and updates.

2. **Devise**
[Devise](https://github.com/plataformatec/devise/wiki) allows for **easy, secure authentication** of users in an application using sessions and password encryption.

4. **Rolify**
[Rolify](https://github.com/RolifyCommunity/rolify/wiki) is used for authorisation by allowing **users to be assigned roles** which can then be used as the basis for setting user permissions regarding data access and management.

6. **CanCanCan**
[CanCanCan](https://github.com/CanCanCommunity/cancancan/wiki) is used in conjunction with Rolify to streamline setting and determining user **permissions**.

8. **RSpec**
[RSpec](https://rspec.info/) allows for efficient **testing** of classes to support Test Driven Development (TDD). It allows us to simulate user requests in order to determine whether our application is returning the desired output.

10. **Stripe**
The Stripe Gem allows us to quickly and easily integrate the [Stripe](https://stripe.com/au) **payment service** into our application. (See below)

12. **Cloudinary**
Using ActiveStorage we can implement **file uploads** using [Cloudinary](https://cloudinary.com/) - a cloud based asset management software. (See below)


#### Third Party Services

* **Stripe**
 [Stripe](https://stripe.com/au)  is a secure payment processing application that is easy to use through API calls. By directing users through Stripe (which is [PCI](https://www.pcisecuritystandards.org/) compliant), it means the complexity of payment processing is handled outside of our application.

* **Cloudinary**
[Cloudinary](https://cloudinary.com/) is an asset hosting and management tool that utilises a Content Delivery Network (CDN) for improved and automated file handling within our application.

Cloudinary’s CDN offloads the bandwidth-hungry process of delivering assets to a user away from your website and into the cloud, where it is delivered and optimised dynamically. Cloudinary optimises for device, browser and bandwidth requirements.[(Cloudinary - File Upload Storage)](https://cloudinary.com/features/file_upload_storage)

> Assets are delivered securely over Transport Layer Security (TLS)  or Security Sockets Layer (SSL). [(Cloudinary - File Upload Storage)](https://cloudinary.com/features/file_upload_storage)


* **Heroku**
> Heroku is a platform as a service (PaaS) based on a managed container system with integrated data services. [(Heroku)](https://www.heroku.com/platform)
> 
Heroku supports a wide range of languages and frameworks and allows developers to quickly and easily host their application on a live server using containers. [(Heroku Platform)](https://www.heroku.com/platform) Containers are used to host multiple applications on a single server, while keeping them completely separate from one another. In Heroku’s case, these containers are known as “Dynos”.

> Dynos are isolated, virtualized Linux containers that are designed to execute code based on a user-specified command. [(Heroku - Dynos)](https://www.heroku.com/dynos)

Dynos are incredibly useful for scaling applications depending on how much traffic your application is seeing, and subsequently how many resources you require. [(Heroku - Dyno Scaling)](https://www.heroku.com/dynos/scaling)

Heroku makes deployment incredibly easy by having automated Dyno building (provided the application framework is supported by Heroku). Essentially, all of the complex setup is performed automatically by Heroku behind the scenes. [(Heroku - Dyno Buildtime)](https://www.heroku.com/dynos/build)

Heroku serves as a remote Git repository which means development updates can be pushed to Heroku as you would any other remote repo.

This means Heroku also has the ability to rollback the application to a previous iteration using each deployment as a release. Technically, however, Heroku does not rollback to a previous release, but builds a new release based on the release specified for the rollback. [(Heroku - Releases)](https://devcenter.heroku.com/articles/releases)

Heroku also provides a whole host of other services and features for developers to use, but given the relatively simple nature of the *Mates Rates* MVP, most of these were not needed for this stage of development and deployment. [(Heroku - Managed Data Services)](https://www.heroku.com/managed-data-services)

* **Github**
[Github](https://github.com/) is a company that provides free remote repository hosting utilising the Git version control system.

Git tracks changes in the application source code in order to manage project development and smooth developer collaboration by automatically handling merges and updates to the code base.

As this project only had a single developer, Github was purely used as a remote storage solution and version control system.

* **Google Fonts**
[Google Fonts](https://fonts.google.com/) is a service provided by Google that allows for developers to use different fonts within their applications distributed across the web.

Google fonts are optimised for speed using caching across websites that make use of the service. If a user has visited a website making use of a Google font that you are using as part of your application, the font will just be loaded from the user’s cache.  [(Google Fonts - About)](https://fonts.google.com/about)

As a bonus, the vast range of fonts that Google provides allows applications to use well designed fonts that improve usability and aesthetics.
	
---

# Database Structure
Rails uses Active Record associations to set up and determine the relationships between models in our database.

Relational databases use what are known as foreign and primary keys to help establish these connections between models.

## Database Relations
### User Model
As can be seen in the ERD above, within Mates Rates the User is the foundational model upon which the application is built. Without the User model as a starting point, all other models have no point of ownership for their existence, whether direct or indirect. In the context of Mates Rates, a Tool must be owned by a User, it doesn’t make sense for a tool to exist without one. Subsequently, if Tools don’t exist, Rentals and Categories existing also doesn’t make sense. In much the same way, if Users didn’t exist, the Role model has no point of reference either.

The User model contains data relating to personal information of a user. As shown in the ERD above, this information is as follows;

##### user_id, type: integer, primary key
The `user_id` is automatically generated as part of Rails and Devise and used to distinguish instances of the User model. Because `user_id` will be unique, it is a great way of referencing specific user instances. As such, the `user_id` is used as the primary key (represented as ‘PK’ in the left-most column of the User table within the ERD).

##### encrypted_password, type: string
When signing up, users will need to specify a password used for logging in to the application. This password is automatically encrypted by Devise using bcrypt, meaning that the password is never stored in plain text.
Within PostgreSQL strings are stored under ‘character varying’ columns within the table.

##### email, type: string
Each user will sign up using their email address, this email address will need to be unique amongst users.

##### first_name, type: string
User’s will also be required to set a `first_name` when signing up so that other users will know who they are when renting tools to one another.

##### last_name, type: string
User’s also set a `last_name`  when signing up. Both `first_name` and `last_name` are used to identify users as they use the application. These fields do not need to be unique amongst users.

##### ADDRESS
HOW WE DOING ADDRESSES?

### Tool Model
Similarly to the User model, the tool model is also critical to the functionality of Mates Rates. Without Tools, there is no reason for the application to exist.

Much like User, there are other models that are dependent on the existence of the Tool model also.

##### tool_id, type: integer, primary key
The `tool_id` behaves in an identical fashion to the `user_id`. It is used to keep track of and identify instances of the Tool. As can be seen in the ERD, this is also the primary key for this table.

##### price, type: integer
Each Tool must have a price associated with it so that users will know how much it will cost them to rent the tool. As outlined in features, tools are rented out for a minimum of a day to keep it easy for owners to manage their tools. Therefore, the `price` data will refer to the cost per day of a rental. Because of this, we can be sure that the overwhelming majority of prices will be able to be represented as a whole dollar value, meaning we can store prices as an integer, rather than a decimal.

##### name, type: string
Fairly self explanatory, this refers to the name (or type) of product. If you have a power drill, this will be ‘Power Drill’. This data is mandatory - although an argument could be made that an image is enough of an identifier, the user experience would be less than optimal.

##### brand, type: string
Many different products make many different and overlapping products, as such we need to allow the user to specify who produces the tool they want to rent out. Similarly to the `name` field, this data is mandatory so that people can easily see what they are renting.

##### model, type: string
Different brands often produce different types of the same product to cater to different audiences. The drill that a professional tradesperson uses will likely be different from the average consumer-level drill, despite being produced by the same brand. As such, we need to allow users to specify a model name or number. However, unlike name and brand, this information is not mandatory. Sometimes the model number is unknown, but more importantly, not every product will have a model number!

##### description, type: text
In the likely event that there needs to be some more identifying information posted about the tool, a description field is provided so that user can enter in any information that they want. The text type specification allows for larger amounts of text to be input when compared to a string. This is used as it is more than possible for a description to become quite lengthy.

##### availability, type: boolean
A user may want to perform some kind of admin/preparation work before allowing their tools to be rented out. As such, allowing them to specify whether the tool is available will be used to prevent it from showing up to other users. Given that this is only a yes or no option, we can represent this data with a boolean. 

##### delivery_options, type: string
If a user is willing to deliver their tool to someone who is renting it, we can let them specify that delivery is available. However, there may also be instances where delivery is the only option - the tool may need to be transported in a specific manner. If this is the case then users will also need to be able to specify that only delivery is available. Although this could be stored differently, storing it as a string allows for easy validation. 

##### delivery_fee, type: decimal
If a tool has a delivery option users need to know how much it will cost to have it delivered. Therefore, a delivery fee is needed. A tool owner will not know the delivery distance before someone rents the tool so users will need to specify a fee per km. Given that the distances will vary and be much more specific compared to rental days, this fee will be stored as a decimal.

##### min_delivery_fee, type: decimal
It may be unfeasible for someone to deliver a tool across a short distance if there is a lot of setup that goes into transporting it. As such, users will be able to specify a minimum to make sure each delivery is worth their while. As with the `delivery_fee` itself, this is also stored as a decimal.

##### user_id, type: integer, foreign key
Finally, as each tool must belong to a user, being able to identify which user the tool belongs to is critical. As such, the `user_id` (with the integer type), is stored in the Tool table. As can be seen in the ERD, this is a foreign key. The foreign key points to the `user_id` of the tool owner.


### Rental Model
##### rental_id, type: integer, primary key
As with the previous models, rentals have a unique id that is used for identification of certain instances of Rental. As shown in the left hand column of the ERD, this is also the primary key for Rentals.

##### start_date, type: date
Rentals are only allowed to go for a certain amount of time, as such dates need to be specified to indicate when this period is. As dates are often used in databases, a `date` type exists, which is what will be used to store the start date.

##### end_date, type: date
The end date behaves in exactly the same way as the start date, but (as the name suggests) specifies the end of the rental period, not the start.

##### returned, type: boolean
Given that the rental transaction is not an immediate, single event trigger, there needs to be some way of specifying that the rental period has been completed successfully. As such, a boolean value will be set to track this status. Once the tool owner has indicated that the tool is returned, this value will update - allowing payment to happen using Stripe.

##### tool_id, type: integer, foreign key
Each rental must reference a tool, because if there is no Tool being referenced, there is no reason for the rental to exist. The `tool_id` is tracked as a foreign key with the type integer to identify which tool the rental refers to. The label ‘FK’ in the table represents that this is a foreign key.

##### user_id, type: integer, foreign key
As with the `tool_id`, each rental must belong to a user, so that the person renting the tool can be identified. In the same way as the `tool_id`, the `user_id` is tracked as a foreign key with the type integer, as can be seen in the ERD. As two separate foreign keys are referenced within the Rental table, it is technically a join table. However, as there is additional information that it also holds it is used slightly differently when compared to other join tables (such as RolesUsers and CategoriesTools). This has been identified in the ERD by using a slightly different colour to the other join tables.

### Role Model
##### role_id, type: integer, primary key
As with all models, Roles have a unique id that is an integer and functions as the primary key. This can be seen in the ERD left-most column, where it is specified as PK.

##### name, type: string
In order to track and manage specified roles in an easy to understand way, a name is assigned with the type string to each Role.

##### resource_type, type: string
Rolify allows Roles to be assigned to multiple different models. In the case where this happens, the resource type indicates which model the role is being applied to. This model name is stored as a string.

##### resource_id, type: integer
In order to identify which instance of a `resource_type` the role is being applied to, the resource id references the id of this instance, stored as an integer.

### RolesUsers Join Table
##### user_id, type: integer, foreign key
As a user can have many roles and a role can be assigned to many users, a join table is required to indicate all of the assignments. Within the table, a column containing `user_id`’s matches up to the a column containing the `role_id` to indicate which role and which user are linked (and vice versa). The ERD shows that the `user_id` is a foreign key (FK), to indicate that it points to the `user_id` primary key.

##### role_id, type: integer, foreign key
All of the above relating to `user_id` also applies to the `role_id`. As can be seen in the ERD, it is also a foreign key.

### Category Model
##### category_id, type: integer, primary key
As can be seen in the ERD, like the other models, categories also have a unique id that serves as the primary key for the category table.

##### name, type:  string
In order to identify the category, a name is stored as a string to easily track and manage the different categories that are created.

### CategoriesTools Join Table
##### category_id, type: integer, foreign key
As a category can have many tools and a tool can be assigned to many categories, a join table is required to indicate all of the assignments. Within the table, a column containing `category_id`’s matches up to the a column containing the `tool_id` to indicate which category and which tool are linked (and vice versa). The ERD shows that the `category_id` is a foreign key (FK), to indicate that it points to the `category_id` primary key.

##### tool_id, type: integer, foreign key
All of the above relating to `category_id` also applies to the `category_id`. As can be seen in the ERD, it is also a foreign key.


## Rails Active Record Associations 

Within Rails, there are six different types of associations that can be used.  [Rails Active Record Associations](https://guides.rubyonrails.org/association_basics.html#choosing-between-belongs-to-and-has-one)

* belongs_to
The `belongs_to` association is used to set up one side of a model association such that one instance of a model (as the name suggests) belongs to an instance of a different model.

* has_one
In the case where a `belongs_to` association is being used to set-up a one-to-one exclusive relationship, the `has_one` association can be used to signify that a model owns or contains an instance of another model. In other words, it is used to specify the `belongs_to` association from the opposite perspective.

* has_many
In the case where a one-to-many relationship is required, the `has_many` association is used. It functions in the same way as a `has_one`, in that it specifies the `belongs_to` association from the opposite side, but instead of referencing only a singular instance, the model that `has_many` of another can contain or own multiple instances of the other model.

* has_many :through
By specifying that a model `has_many :through` a different model, it indicates that the first model `has_many` instances of a second model by referencing a third model which has identifying information relating to the other models. Typically, this is used to set up what is known as a many-to-many relationship.

The `has_many :through` association can also be used to set up quick references through other `has_many` associations that may already exist between models.

* has_one :through
Similarly to the `has_many :through` association, `has_one :through` specifies a one-to-one relationship between two models using a third, intermediary model that references the other model.

* has_and_belongs_to_many
A `has_and_belongs_to_many` association specifies a many-to-many connection without the need for the third model to exist. It uses what is known as a join-table to indicate which instances of each model relate to which. Active Record handles all of the ‘joining’ automatically when using a `has_and_belongs_to_many` association.  `has_many :through` associations also use join tables also, but they are manually specified and will hold other pieces of data.

### Mates Rates Associations

#### User Model
	* devise
	Devise is used to generate the User model with certain attributes for the purposes of authentication. 
**Authenticatable, Recoverable, Registerable, Rememberable, Validateable**
**LIST OF DEVISE IMPLEMENTATIONS AND DESCRIPTIONS HERE.**

	* has_many :tools
	A User can have many Tools that they own and wish to rent out. The ability to create and manage tools is restricted to a User with the role of ‘Owner’.  This relationship specifies that a User does not need to have Tools (they may just be looking to rent tools). However, if they do have tools to rent out, they can have many tools associated in the model.

	* has_many :rentals
	Users also have the ability to rent out many	different tools from other users.  They do not need to have rentals, as they may be inactive within the application if they have no projects to complete, and thus no need to rent any tools.

	* has_many :rented_tools, through: :rentals, class_name: ‘Tool’
	Used as an easy way to keep track of the tools that a user has, is, or will be renting.  It assigns a rented tool to a user by referencing the tool through the rental model. Although the relationship is similar to the `has_many :tools` relationship, this is distinct in that it tracks and associates a different type of (ie: rented, not owned) tool.

Note that this relationship is represented differently within the ERD. Because the relationship is only specified for ease of information access the application, and not actually required at all.
	
	* has_and_belongs_to_many :roles
	As outlined above, the ability create and manage tools is restricted to a User with the role of ‘Owner’.  Although the distinction between an ‘Owner’ and a ‘Renter’ is only used to improve user experience as part of the MVP, the requirements and details required for signing up as either an ‘Owner’ or a ‘Renter’ may differ in future and so was built for extensibility. Therefore, a user can have many roles, while each role can also contain many users.

On top of this, an ‘Admin’ role exists that allows the management of all listings on the site.

Roles are created and assigned using Rolify. Users and their roles are stored in a join table generated by Rolify called UsersRoles. 


#### Tool Model
	* belongs_to :user
	Each and every tool must have an associated user to be able to be created, and thus a Tool belongs to a User. Without a user to reference, the tool would not have details for where or how to rent the tool.

	* has_many :rentals
	Although a Tool obviously can’t be rented out by multiple people at the same time, future, past and current rentals can all apply to a single tool. As such, Tools can have many Rentals.  Additionally, a tool does not necessarily need a rental to exist.


	* has_and_belongs_to_many :categories
	A tool can fall under a wide range of different categories, but categories can also contain a wide range of different tools! As such, tools have and belong to many different categories. Using a CategoriesTools join table, tools, their categories and vice versa can be tracked.

	* has_many :renters, through: :rentals, class_name: ‘User’
	Much like a user can have rented many tools, a tool will also keep track of the users that have rented the tool by referencing those users through the rental model.

Note that this relationship is represented differently within the ERD. Because the relationship is only specified for ease of information access the application, and not actually required at all.
	
#### Rental Model
	* belongs_to :tool
	A rental must reference a tool, otherwise there is no way of knowing what the rental refers to at all. Therefore, each rental must belong to a tool. 

	* belongs_to :user
	A rental must also reference the user that is renting the tool (Note - this is different to the tool owner!). Without someone paying money to rent the tool, there is no rental. As such, a rental must belong to a user.

#### Category Model
* has_and_belongs_to_many :tools
As discussed in the tool model section, a tool can fall under a wide range of different categories, but categories can also contain a wide range of different tools! As such, categories have and belong to many different tools. Using a CategoriesTools join table, categories, their tools and vice versa can be tracked.

#### Role Model
* has_and_belongs_to_many :users
Users can be assigned different roles which will determine what they can see and do within the application. Roles can also have many different users. Although this functionality is not utilised as part of the MVP, it was included for easy extensibility in the future.

Roles are created and assigned using Rolify. Users and their roles are stored in a join table generated by Rolify called UsersRoles. 



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
