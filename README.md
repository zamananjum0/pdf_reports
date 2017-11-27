# PDF Reports

## Description

This gem provides a simple and extremely flexible way to generate pdf reports in Ruby applications. It works well with Rack based web applications, such as Ruby on Rails.

## Getting Started

You can use PdfReports class to create template as like this:

```ruby
Reports::PdfReports.new.create(results, cls, current_user) render pdf: "file.pdf", page_size: current_user.paper_size, orientation:
'Landscape' end
end
```
Call body method from PdfReports to WickedCore and global variable.

## How To Use It

Add the gem to yours Gem file pointing to this repo:

```ruby
gem 'reports', :git =>'git@github.com:daveih/pdf_reports.git'
```

Then run:

```
bundle install
```

The spinner effect during the generation is hold by the Gem itself but be sure to have under your **assets** the below dependencies:

- bootstrap
- font-awesome
- jquery
