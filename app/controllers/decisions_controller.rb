class DecisionsController < ApplicationController
  def index
    @decisions = Decision.all

    render("decision_templates/index.html.erb")
  end

  def show
    @decision = Decision.find(params.fetch("id_to_display"))

    render("decision_templates/show.html.erb")
  end

  def new_form
    render("decision_templates/new_form.html.erb")
  end

  def create_row
    @decision = Decision.new

    @decision.user_id = params.fetch("user_id")
    @decision.title = params.fetch("title")

    if @decision.valid?
      @decision.save

      redirect_to("/decisions", :notice => "Decision created successfully.")
    else
      render("decision_templates/new_form.html.erb")
    end
  end

  def edit_form
    @decision = Decision.find(params.fetch("prefill_with_id"))

    render("decision_templates/edit_form.html.erb")
  end

  def update_row
    @decision = Decision.find(params.fetch("id_to_modify"))

    @decision.user_id = params.fetch("user_id")
    @decision.title = params.fetch("title")

    if @decision.valid?
      @decision.save

      redirect_to("/decisions/#{@decision.id}", :notice => "Decision updated successfully.")
    else
      render("decision_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @decision = Decision.find(params.fetch("id_to_remove"))

    @decision.destroy

    redirect_to("/decisions", :notice => "Decision deleted successfully.")
  end
end
