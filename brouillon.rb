@synthesis = []
@categories.each do |category|
  category_score = 0
  category_best_score = 0
  category.questions.each do |question|
    best_answer = question.answers.order(:score).last
    user_answer = question.user_answers.where(user: current_user).first
    category_score += user_answer.answer.score
    category_best_score += best_answer.score
  end
  @synthesis << {category: category.name,
                score: category_score,
                best_score: category_best_score,
                comment: category.comments.select { |comment| (comment.min .. comment.max).include?(category_score)}}
end


<div class="container">
  <div class="card-title">
    <h1>Analyse</h1>
  </div>
  <div class="card-synthesis">
    <% categories_scores = [] %>
    <% categories_best_scores = [] %>
    <ul>
      <% @categories.each do |category| %>
        <div class="card-results">
          <%= category.name %>
          <% scores = [] %>
          <% best_scores = [] %>
          <% category.questions.each do |question| %>
            <% best_answer = question.answers.order(:score).last %>
            <% user_answer = question.user_answers.where(user: current_user).first %>
            <% scores.push(user_answer.answer.score) %>
            <% best_scores.push(best_answer.score) %>
          <% end %>
          <p>Score : <%= category_score = scores.sum %> / <%= category_best_score = best_scores.sum %></p>
          <% categories_scores.push(category_score) %>
          <% categories_best_scores.push(category_best_score) %>
        </div>
      <% end %>
    </ul>
    <p>Total : <%= global_score = categories_scores.sum %> / <%= global_best_score = categories_best_scores.sum %></p>
  </div>
  <div class="card-analysis">
    <% @categories.each do |category| %>
    <%= category.name %>
      <% category_score = 0 %>
      <% category.questions.each do |question| %>

            <% user_answer = question.user_answers.where(user: current_user).first %>
            <% category_score += user_answer.answer.score %>

          <% end %>
      <% user_comment = category.comments.select { |comment| (comment.min .. comment.max).include?(category_score)} %>
      <%= user_comment %>
      <%= @synthesis %>
    <% end %>
  </div>
  <%= link_to "Partager mes résultats" %>
</div>