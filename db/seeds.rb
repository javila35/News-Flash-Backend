Comment.delete_all
Bookmark.delete_all
User.delete_all

joe = User.create(username: "joe", password: "123", first_name: "Joe", location: "Seattle")
tyler = User.create(username: "tyler", password: "123", first_name: "Tyler", location: "San Diego")

jb1 = Bookmark.create(user_id: joe.id, article_title: "2020 NFL Draft Grades for Every Team - News Info Park", article_link: "https://newsinfopark.com/sports/2020-04-29/article/2020-nfl-draft-grades-for-every-team-23242/nip-web-desk-team/", article_img: "https://img.bleacherreport.net/img/slides/photos/004/390/547/5791fe028d6b8f79cdd120eed4a90d56_crop_exact.jpg?h=533&w=800&q=70&crop_x=center&crop_y=top")
jb2 = Bookmark.create(user_id: joe.id, article_title: "Orange County Recovery Task Force Proposes That Walt Disney World Can Open At Their Own Discretion - wdwnt.com", article_link: "https://wdwnt.com/2020/04/orange-county-recovery-task-force-proposes-that-walt-disney-world-can-open-at-their-own-discretion/" , article_img: "https://wdwnt-buzzy.s3.amazonaws.com/2020/04/magic-kingdom-main-street-closure-cinderella-castle.jpg")

tb1 = Bookmark.create(user_id: tyler.id, article_title: "Elon Musk Goes Full 'Reopen America' Truther Ahead of Crucial Tesla Q1 Earnings Call - The Drive", article_link: "https://www.thedrive.com/news/33219/elon-musk-goes-full-reopen-america-truther-ahead-of-crucial-tesla-q1-earnings-call", article_img: "https://api.thedrive.com/wp-content/uploads/2020/04/AP_19327815401015.jpg?quality=85")
tb2 = Bookmark.create(user_id: tyler.id, article_title: "iPhone SE review: Small screen, huge performance - Ars Technica", article_link: "https://arstechnica.com/gadgets/2020/04/iphone-se-review-though-it-be-but-little-it-is-fierce/", article_img: "https://cdn.arstechnica.net/wp-content/uploads/2020/04/iPhone-SE-2020-back-760x380.jpeg")

jc1 = Comment.create(user_id: joe.id, bookmark_id: jb1.id, comment_text: "Interesting.")
jc2 = Comment.create(user_id: joe.id, bookmark_id: jb2.id, comment_text: "I concur.")

5.times { |i|
    user = User.create(
        username: "user#{i}",
        password: '123',
        first_name: Faker::TvShows::TwinPeaks.character,
        location: Faker::TvShows::TwinPeaks.location,
        bio: Faker::Hipster.paragraph(sentence_count: 3)
    )
    bm = Bookmark.create(
        user_id: user.id, 
        article_title: "2020 NFL Draft Grades for Every Team - News Info Park", 
        article_link: "https://newsinfopark.com/sports/2020-04-29/article/2020-nfl-draft-grades-for-every-team-23242/nip-web-desk-team/", 
        article_img: "https://img.bleacherreport.net/img/slides/photos/004/390/547/5791fe028d6b8f79cdd120eed4a90d56_crop_exact.jpg?h=533&w=800&q=70&crop_x=center&crop_y=top"
    )
    Comment.create(
        user_id: user.id,
        bookmark_id: bm.id,
        comment_text: Faker::Hipster.sentence
    )
}