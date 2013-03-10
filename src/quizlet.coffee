# TODO: $.getJSON for question data
# TODO: question paging
# TODO: multiple input types


window.Quizlet = (selector, options) ->
  $container   = $(selector)
  questions    = options.questions
  $optionBox   = $("<div class='quizlet-options'>")
  $questionBox = $("<div class='quizlet-question'>")
  questionNum  = 0
  optNum = 0

  Quizlet.questions = []

  # TODO: one per page, not for each question
  for question in questions
    $container.append "<h2 class='quizlet-title'>#{question.title}</h2>"

    for opt in question.options
      attrs = $.extend {}, opt, { num: optNum } # Merge two objects
      Quizlet.questions.push(attrs)

      Quizlet.questions[optNum].correct = opt.correct || false

      # TODO: does radio button group need to be unique per question?
      $optionBox.append """
        <div class='quizlet-option' data-num='#{attrs.num}'>
          <input type='radio' class='quizlet-radio-btn' name='quizlet-radio-#{questionNum}' value='#{attrs.text}'>
            #{attrs.text}
        </div>
      """
      optNum++

    questionNum++

    # TODO: why isn't append() working with jQuery objects?
    $questionBox.append $optionBox[0].outerHTML # TODO
    submitText = opt.submitText || 'Submit'
    $questionBox.append """
      <a href='#' class='quizlet-submit'>#{options.submitText || 'Submit'}</a>
    """
    $container.append($questionBox[0].outerHTML) # TODO
    $optionBox.html('')
    $questionBox.html('')



$(document.body).delegate '.quizlet-submit', 'click', (e) ->
  $optionBox = $(@).parent().find('.quizlet-options')
  $options   = $optionBox.find('.quizlet-option')
  correct    = false

  # Ensure something has been checked
  if $optionBox.find('.quizlet-radio-btn:checked').length == 0
    $empty = $("<div class='quizlet-empty'>Please check an answer!</div>").hide()
    $optionBox.parent().find(".quizlet-title").after($empty)
    $empty.slideDown('fast')
  else
    $('.quizlet-empty').hide()

  for opt in $options
    btn = $(opt).find('.quizlet-radio-btn')
    num = parseInt $(opt).data('num')

    if $(btn).is(':checked') && Quizlet.questions[num].correct
      correct = true


  if correct
    alert "Correct!"
  else
    alert "Incorrect!"


  e.preventDefault()
  return false
