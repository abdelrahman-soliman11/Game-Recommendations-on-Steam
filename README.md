# Game-Recommendations-on-Steam
The dataset contains cleaned and preprocessed 5M+ user recommendations (reviews) from a Steam Store - a leading online platform for purchasing and downloading video games, DLC, and other gaming-related content. Additionally, it contains detailed information about games and add-ons.

#Content
The dataset consists of three main entities:

- games.csv - a table of games (or add-ons) information on ratings, pricing in US dollars $, release date, etc. A piece of extra non-tabular details on games, such as descriptions and tags, is in a metadata file;
- users.csv - a table of user profiles' public information: the number of purchased products and reviews published;
- recommendations.csv - a table of user reviews: whether the user recommends a product. The table represents a many-many relation between a game entity and a user entity.
- 
#The dataset does not contain any personal information about users on a Steam Platform. A preprocessing pipeline anonymized all user IDs. All collected data is accessible to a member of the general public.

#Acknowledgements
The dataset was collected from Steam Official Store. All rights on the dataset thumbnail image belong to the Valve Corporation.

#Inspiration
Use this dataset to practice building a game recommendation system or performing an Exploratory Data Analysis on products from a Steam Store.
