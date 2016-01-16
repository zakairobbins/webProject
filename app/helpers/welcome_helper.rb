module WelcomeHelper

  def random_testimonial
    quotes = [
      "ALLEN P.: 'Thank you once again for your help....'",
      "CYNTHIA R.: 'Thank you. This resume will really help me. Everyone who sees it is impressed.'",
      "DAVID A.: 'This will really help me. Thanks for your work.'",
      "Gloria: 'Here in at Disney in Florida everything is great!! I have been making lots of friends and having such a good time!! I just wanted to thank you for helping me get here! :D'",
      "JENNIFER: 'Just want to thank you for the great presentation ... of my resume. The professionalism you have portrayed is astonishing.'",
      "MAX M.: 'Thank you so much.  Now all I have to do is find a job. Thanks again for all your help.'",
      "SAMANTHA F.: 'Thank you! Thank you! Thank you! It looks really great.'",
      "MATTHEW F.: 'Thanks again appreciate all your work!  Looks great!'",
      "BELLA C.: 'It Looks Great I Thank You So Much!'",
      "MELODY B.: 'Thank you so much!  Yes, it\'s wonderful.  I appreciate you!'"
    ]
    return quotes.sample
  end

end
