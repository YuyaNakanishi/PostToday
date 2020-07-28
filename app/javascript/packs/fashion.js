import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment_text_area').removeClass('hidden')
  })
}

const addNewComment = (comment) => {
  $('.comment_container').append(
    `<div class="comment"><p>${comment.comment.body}</p></div>`
  )
}

document.addEventListener('turbolinks:load', () => {
  const dataset = $('#fashion-show').data()
  const fashionId = dataset.fashionId

  $('.add-comment-button').on('click', () => {
    const comment = $('#comment_comment').val()
    if (!comment){
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/api/fashions/${fashionId}/comments`,{
        comment: {comment: comment}
    })
        .then((res) => {
          const comment = res.data
          addNewComment(comment)
          $('#comment_comment').val('')
        })
    }
  })


  axios.get(`/api/fashions/${fashionId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        addNewComment(comment)
      })
    })

  handleCommentForm()

  axios.get(`/api/fashions/${fashionId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      if (hasLiked){
        $('.active-heart').removeClass('hidden')
      } else {
        $('.inactive-heart').removeClass('hidden')
      }
    })

    $('.inactive-heart').on(`click`, () => {
      axios.post(`/api/fashions/${fashionId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $('.active-heart').removeClass('hidden')
            $('.inactive-heart').addClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('Error') 
          console.log(e)
        })
    })
    
    $('.active-heart').on(`click`, () => {
      axios.delete(`/api/fashions/${fashionId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $('.active-heart').addClass('hidden')
            $('.inactive-heart').removeClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('Error') 
          console.log(e)
        })
    })

  })
