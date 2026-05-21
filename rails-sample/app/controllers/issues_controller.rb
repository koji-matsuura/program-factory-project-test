class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end
  
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      render json: @issue, status: :created
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def issue_params
    params.require(:issue).permit(:title, :description, :user_id, :status)
  end
end
