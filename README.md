test_blog
=========

Implementation and design:
==========================
I decided to use angular for the entire comments object. The comments are added using an ajax call.
I am not refreshing the entire comments list but rather appending the comment if the call is successful.

I implemented the labels as an object that belongs to posts, which means the can be more than one similar record.
Another way to go could have been to save unique labels and connect them to posts via a connecting table but
that seemed to be complicating things

I placed all the JS code in comments.js for simplicity. If I were to build a bigger application I would have separated
The controller, app and factories.

The user has to write his name when he comments but I could have made him enter his name on registration and use that.
If I had more time that is what I would have done.



