module SubmissionsHelper
    include ApplicationHelper
    def get_data_for_each_proposal(report_user_id, submissions, is_admin)
      # arrays for data for each proposal
      @reviews_percent = []
      @reviews_completed = []
      @assigned_reviewers = []
      @innovation = []
      @breadth = []
      @quality = []
      @recommendation = []

      # Get data for each proposal
      submissions.each do |submission|

        # if the user is not an admin, just get the data for their report
        if is_admin == false
            review = SubmissionReview.where(submission_id: submission.id, reviewer_id: report_user_id)
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
            next
        end

        # if the user IS an admin, get the data for all reviews
        reviews = SubmissionReview.where(:submission_id => submission.id)
        reviewers = ReviewerAssignment.where(:submission_id => submission.id)

        @assigned_reviewers.push(reviewers.length)

        if reviews.length == 0
          # nothing to calculate
          @reviews_completed.push(0)
          @innovation.push(0)
          @breadth.push(0)
          @quality.push(0)
          @recommendation.push(4)
          @reviews_percent.push(0)
        else
          @reviews_percent.push(to_percent(reviews.length, reviewers.length))
          @reviews_completed.push(reviews.length)

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

          @innovation.push( average(i, reviews.length) )
          @breadth.push( average(b, reviews.length) )
          @quality.push( average(q, reviews.length) )
          @recommendation.push( average(r, reviews.length) )
        end

      end
    end

    def get_tier_from_percentage(perc)
      case
        when perc == 0.0
          return 0
        when perc > 0.0 && perc < 20.0
          return 1
        when perc >= 20.0 && perc < 40.0
          return 2
        when perc >= 40.0 && perc < 60.0
          return 3
        when perc >= 60.0 && perc < 80.0
          return 4
        when perc >= 80.0 && perc < 100.0
          return 5
        when perc == 100
          return 6
      end
    end
end
