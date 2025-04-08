Resource.create!([
  {
    name: "Winter Jackets for Adults",
    posted_at: 5.days.ago,
    category: "Clothing",
    description: "Seeking donations of warm adult winter jackets, especially in sizes L–XXL. Will be distributed at the community center.",
    fulfilled: false
  },
  {
    name: "Temporary Housing for Family of 4",
    posted_at: 10.days.ago,
    category: "Housing",
    description: "Looking for temporary housing for a recently displaced family with two young children. Preferably near downtown area.",
    fulfilled: false
  },
  {
    name: "Weekly Grocery Boxes",
    posted_at: 2.days.ago,
    category: "Food",
    description: "Offering fresh produce, dry goods, and dairy for pickup every Saturday. Registration required.",
    fulfilled: true
  },
  {
    name: "Bus Passes for Job Interviews",
    posted_at: 7.days.ago,
    category: "Transportation",
    description: "Providing one-time-use bus passes for job seekers. Limit 3 per person per month.",
    fulfilled: false
  },
  {
    name: "Resume Writing Support",
    posted_at: 12.days.ago,
    category: "Job Assistance",
    description: "Volunteers available for one-on-one resume review and coaching every Wednesday afternoon.",
    fulfilled: true
  },
  {
    name: "Evening Childcare Volunteers",
    posted_at: 3.days.ago,
    category: "Childcare",
    description: "We need volunteers to supervise children (ages 4–10) while parents attend English classes from 6–8pm on weekdays.",
    fulfilled: false
  },
  {
    name: "Beginner English Conversation Class",
    posted_at: 1.day.ago,
    category: "Language Tutoring",
    description: "Free drop-in sessions every Monday and Thursday evening. Focus on practical English for daily life.",
    fulfilled: false
  },
  {
    name: "Donated Laptops for Students",
    posted_at: 9.days.ago,
    category: "Technology",
    description: "We are accepting and distributing gently used laptops for students starting adult education programs.",
    fulfilled: true
  }
])

Event.create!([
  {
    title: "ESOL Conversation Group",
    description: "Weekly conversation practice for English language learners at all levels.",
    location: "Portland Public Library - Community Room",
    date: Date.new(2025, 4, 10),
    time: "6:00 PM – 7:30 PM"
  },
  {
    title: "Citizenship Prep Class",
    description: "6-week course to prepare for the U.S. naturalization interview and test.",
    location: "Learning Works - Room 201",
    date: Date.new(2025, 4, 12),
    time: "10:00 AM – 12:00 PM"
  },
  {
    title: "Spanish-English Language Exchange",
    description: "Bilingual language exchange for intermediate learners of Spanish and English.",
    location: "Coffee by Design - India St",
    date: Date.new(2025, 4, 15),
    time: "5:30 PM – 7:00 PM"
  },
  {
    title: "Pronunciation & Accent Workshop",
    description: "Special workshop focused on improving English pronunciation and intonation.",
    location: "YMCA Adult Learning Center",
    date: Date.new(2025, 4, 17),
    time: "4:00 PM – 5:30 PM"
  },
  {
    title: "Job Search Support for ESL Learners",
    description: "Help with resumes, job applications, and interview prep for English learners.",
    location: "Greater Portland Immigrant Welcome Center",
    date: Date.new(2025, 4, 18),
    time: "2:00 PM – 3:30 PM"
  },
  {
    title: "English for Parents & Caregivers",
    description: "Supportive class for parents with school-age children, focused on school communication.",
    location: "Reiche Community School",
    date: Date.new(2025, 4, 19),
    time: "9:30 AM – 11:00 AM"
  },
  {
    title: "Intro to Arabic Literacy",
    description: "Beginner Arabic class focusing on reading, writing, and basic vocabulary.",
    location: "East End Community Center",
    date: Date.new(2025, 4, 20),
    time: "5:00 PM – 6:30 PM"
  },
  {
    title: "MaineCare Access Help (Multilingual)",
    description: "Drop-in help with healthcare applications in multiple languages.",
    location: "Portland Adult Education",
    date: Date.new(2025, 4, 22),
    time: "1:00 PM – 3:00 PM"
  }
])

