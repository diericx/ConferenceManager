module AbstractProposalsHelper
    def get_data_for_each_proposal()
      # Get data for each proposal
      @abstract_proposals.each do |abstract|

        # if the user is not an admin, just get the data for their report
        if is_admin?(current_user) == false
            review = AbstractReport.where(abstractId: abstract.id, reviewerId: current_user.id)
            # if the user has submitted a review
            if review.length > 0
                @innovation.push(review[0].innovation)
                @breadth.push(review[0].breadth)
                @quality.push(review[0].presentationQuality)
                @recommendation.push(review[0].recommendation)
            else
                @innovation.push("")
                @breadth.push("")
                @quality.push("")
                @recommendation.push("Not Reviewed")
            end
            return
        end

        # if the user IS an admin, get the data for all reviews
        reviews = AbstractReport.where(:abstractId => abstract.id)
        reviewers = AbstractReviewerAssignment.where(:abstract_id => abstract.id)

        @assigned_reviewers.push(reviewers.length)
        if reviews.length == 0
          # nothing to calculate
          @innovation.push(0)
          @breadth.push(0)
          @quality.push(0)
          @recommendation.push(0)
          
          if reviewers.length == 0
            @reviews_percent.push(0)
          end
        else
          @reviews_percent.push(reviews.length.to_f / reviewers.length.to_f * 100)

          # get data for averages
          i = b = q = r = 0
          reviews.each do |review|
            if review.conflictOfInterest == true
              next
            end
            i += review.innovation
            b += review.breadth
            q += review.presentationQuality
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
