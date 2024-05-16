class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top how_to_use faq term_of_service privacy_policy support contact]
  def top; end

  def how_to_use; end

  def faq; end

  def term_of_service; end

  def privacy_policy; end

  def support; end

  def contact; end
end
