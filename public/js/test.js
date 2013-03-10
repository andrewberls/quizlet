Quizlet('.quizlet-container', {
  questions: [
    {
      title: 'This is question 1',
      options: [
        { text: 'One (incorrect)' },
        { text: 'Two (correct)', correct: true },
        { text: 'Three (incorrect)' },
      ]
    },

    {
      title: 'This is question 2',
      options: [
        { text: 'One (Correct)', correct: true },
        { text: 'Two (Incorrect)' },
        { text: 'Three (incorrect)' },
      ]
    }
  ],
  submitText: 'Check answers &raquo;'
})
