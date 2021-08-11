# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
<div id="page-content">
    <h1 class="text-center mt-4"> Listing All Articles</h1>
    <div class="container">
        <div class="mb-3 d-flex justify-content-center">
            <%= link_to 'Create new', new_article_path, class: "btn btn-success" %>
        </div>
        <% @articles.each do |article| %>
            <div class="row justify-content-md-center">
                <div class="col-8 mt-4">
                    <div class="card text-center shadow mb-5 bg-white rounded">
                        <div class="card-header">
                            <div class="fst-italic">
                                By Saraman Karamta
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><%= link_to article.title, article_path(article), class: "text-success" %></h5>
                            <p class="card-text"><%= truncate(article.description, length:100) %></p>
                            <a href="#" > <%= link_to "View", article_path(article), class: "btn btn-outline-primary" %></a>
                            <a href="#" ><%= link_to "Edit", edit_article_path(article), class: "btn btn-outline-success" %></a>
                            <a href="#" ><%= link_to "Delete", article_path(article), method: :delete, data: { confirm: "Are you sure?"}, class: "btn btn-outline-danger" %></a>
                        </div>
                        <div class="card-footer text-muted">
                            <small>Created <%= time_ago_in_words(article.created_at) %> ago, Edited <%= time_ago_in_words(article.updated_at) %> ago</small>
                        </div>
                    </div>
                </div>
            </end>
        <% end %>
    </div>
</div>