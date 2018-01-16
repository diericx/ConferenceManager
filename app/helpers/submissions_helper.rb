module SubmissionsHelper
    def get_data_for_each_proposal()
      # Get data for each proposal
      @submissions.each do |submission|

        # if the user is not an admin, just get the data for their report
        if is_admin?(current_user) == false
            review = SubmissionReview.where(submission_id: submission.id, reviewer_id: current_user.id)
            # if the user has submitted a review
            if review.length > 0
                @innovation.push(review[0].innovation)
                @breadth.push(review[0].breadth)
                @quality.push(review[0].presentation_quality)
                @recommendation.push(review[0].recommendation)
            else
                @innovation.push("")
                @breadth.push("")
                @quality.push("")
                @recommendation.push(4)
            end
            return
        end

        # if the user IS an admin, get the data for all reviews
        reviews = SubmissionReview.where(:submission_id => submission.id)
        reviewers = ReviewerAssignment.where(:submission_id => submission.id)

        @assigned_reviewers.push(reviewers.length)
        if reviews.length == 0
          # nothing to calculate
          @innovation.push(0)
          @breadth.push(0)
          @quality.push(0)
          @recommendation.push(4)
          
          if reviewers.length == 0
            @reviews_percent.push(0)
          end
        else
          @reviews_percent.push(reviews.length.to_f / reviewers.length.to_f * 100)

          # get data for averages
          i = b = q = r = 0
          reviews.each do |review|
            if review.conflict_of_interest == true
              next
            end
            i += review.innovation
            b += review.breadth
            q += review.presentation_quality
            r += review.recommendation
          end

          @innovation.push(i/reviews.length)
          @breadth.push(b/reviews.length)
          @quality.push(q/reviews.length)
          @recommendation.push(r/reviews.length)
        end

      end
    end
end
