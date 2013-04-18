Quizlet is a framework for creating interactive quizzes in JavaScript. The project is still very much a work in progress.

Some goals / todo items:
* Ajax loading of quiz content from a server endpoint
* Pagination of questions
* Score aggregation and display

Quizzes are defined entirely in JavaScript code. From [public/test.js](https://github.com/andrewberls/quizlet/blob/master/public/js/test.js):
```javascript
  
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
```

which currently yields the following:

![example image](http://i.imgur.com/mEtdcko.png)
