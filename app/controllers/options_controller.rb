class OptionsController < ApplicationController
  def index
    @options = Option.all

    render("option_templates/index.html.erb")
  end

  def show
    @option = Option.find(params.fetch("id_to_display"))

    render("option_templates/show.html.erb")
  end

  def new_form
    render("option_templates/new_form.html.erb")
  end

  def create_row
    @option = Option.new

    @option.decision_id = params.fetch("decision_id")
    @option.description = params.fetch("description")
    @option.user_id = params.fetch("user_id")

    if @option.valid?
      @option.save

      redirect_to("/options", :notice => "Option created successfully.")
    else
      render("option_templates/new_form.html.erb")
    end
  end

  def edit_form
    @option = Option.find(params.fetch("prefill_with_id"))

    render("option_templates/edit_form.html.erb")
  end

  def update_row
    @option = Option.find(params.fetch("id_to_modify"))

    @option.decision_id = params.fetch("decision_id")
    @option.description = params.fetch("description")
    @option.user_id = params.fetch("user_id")

    if @option.valid?
      @option.save

      redirect_to("/options/#{@option.id}", :notice => "Option updated successfully.")
    else
      render("option_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @option = Option.find(params.fetch("id_to_remove"))

    @option.destroy

    redirect_to("/options", :notice => "Option deleted successfully.")
  end
end
