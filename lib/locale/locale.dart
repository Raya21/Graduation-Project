import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "User Name": "اسم المستخدم",
          "E-mail": "البريد الإلكتروني",
          "Password": "كلمة السر",
          "Settings": "الإعدادات",
          "Change Password": "تغيير كلمة السر",
          "Arabic": "عربي",
          "English": "انجليزي",
          "Colse": "إغلاق",
          "Account": "الحساب الشخصي",
          "Language": "اللغة",
          "Home": "الصفحة الرئيسية",
          "Family Data": "بيانات الأسرة",
          "Loan Request": "طلب قرض",
          "Contact us": "تواصل معنا",
          "Log out": "تسجيل الخروج",
          "Profile": "الملف الشخصي",
          "Profile photo": "اختر صورة الملف الشخصي",
          "Camera": "الكاميرا",
          "Gallery": "المعرض",
          "Notifications": "الإشعارات",
          "Content Settings": "إعدادات المحتوى",
          "Social": "اجتماعي",
          "Privacy and Security": "الخصوصية والأمان",
          "Theme Dark": "مظهر داكن",
          "Account Active": "الحساب نشط",
          "Opportunity": "فرصة",
          "Contact Us": "تواصل معنا",
          "Name": "الإسم",
          "Subject": "الموضوع",
          "Email": "البريد الإلكتروني",
          "Message": "الرسالة",
          "Send": "إرسال",
          "Create Account": "إنشاء حساب",
          "Sign up text":
              "إنشاء حساب يعني أنك موافق على شروط الخدمة وسياسة الخصوصية الخاصة بنا",
          "have an account": "لديك حساب؟",
          "Sign In": "تسجيل الدخول",
          "Sign Up": "اشتراك",
          "Welcome!": "أهلا وسهلا !",
          "Login": "تسجيل الدخول",
          "Forget Password?": "نسيت كلمة السر؟",
          "Don't have an account?": "ليس لديك حساب؟",
          "Create": "إنشاء",
          "Reset Password": "إعادة تعيين كلمة السر",
          "Old password": "كلمة السر القديمة",
          "New password": "كلمة السر الجديدة",
          "Confirm": "تأكيد",
          "Apply for a loan": "التقدم بطلب للحصول على قرض",
          "t1_loan":
              "في بداية كل فصل دراسي يعلن صندوق الإقراض عن بدء استقبال طلبات القروض للطلبة المحتاجين في مؤسسات التعليم العالي الفلسطينية لفترة زمنية محددة ، وعلى الطالب الراغب في تقديم الطلب القيام بما يلي:",
          "t2_loan": "1- املأ الطلب من خلال",
          "t3_loan": "من خلال حساب الطالب",
          "t4_loan":
              "2- يُسلم الطالب جميع الوثائق والمستندات الثبوتيه المطلوبة منه لعمادة شؤون الطلبة ويتم تدقيق طلبه مباشرة ويستلم نموذج إثبات تقديم طلب وتدقيقه، وفي حالة لم يُتِم الطالب هذه الخطوة ، يعتبر طلبه غير مكتمل ولا ينظر فيه . ",
          "t5_loan":
              "3- في حالة فقدان الطالب اسم المستخدم و/ أو الرقم السري الخاص به عليه مراجعة دائرة شؤون الطلبة في مؤسسته التعليمية ليتم تزويده برقم سري جديد.",
          "t6_loan": "رابط الخدمات الإلكترونية",
          "Conditions for applying for a loan": "شروط التقدم للحصول على قرض",
          "t1_q":
              "1- أن يكون المتقدم طالبا منتظما في إحدى مؤسسات التعليم العالي في فلسطين ومحتاجا من الناحية المادية ( في برنامج البكالوريوس أو الدبلوم المتوسط فقط ) .",
          "t2_q": "2- أن يكون قد اجتاز بنجاح فصلا دراسيا على الأقل.",
          "t3_q":
              "3- أن لا يقل المعدل الدراسي التراكمي للطالب عن 65% لطلبة البكالوريوس و 60% لطلبة الدبلوم أو ما يوازيه .",
          "t4_q":
              "4- أن لا يكون الطالب مستفيداً أو حاصلا على منحة جامعية أو منحة تفوق أو مساعدة مالية من أي مصدر آخر تفوق حاجته.",
          "t5_q":
              "5- أن يكون الطالب المرشح مسجلاً على الأقل ( 12 ) ساعة معتمدة في الفصل الذي تقدم به للحصول على القرض أو المنحة.",
          "Notes:": "ملاحظات:",
          "t6_q":
              "1- نسبة القرض التي يحصل عليها الطالب يتم حسابها بناءً على معايير الحاجة وأعلى نسبة قد يحصل عليها الطالب هي 75% من رسوم الساعات الدراسية فقط ( بدون رسوم التسجيل، انترنت،،،،الخ ).",
          "t7_q":
              "2- إضافة الى الملاحظة رقم (1) لا تتجاوز قيمة القرض التي يقدمها الصندوق عن 1000 دينار أردني بأي حال من الأحوال للطالب الواحد في الفصل الدراسي الواحد.",
          "t8_q":
              "3- (طلبة التعليم الموازي : تحسب رسومهم الدراسية حسب الرسوم المعتمدة العادية ( ليس حسب أسعار الدراسة",
          "Personal Info": "المعلومات الشخصية",
          "Contact Info": "معلومات الإتصال",
          "Educational Info": "معلومات الدراسة",
          "Attachments": "المرفقات",
          "Person Information": "المعلومات الشخصية",
          "Full Name:": "الإسم رباعي:",
          "ID:": "رقم الهوية:",
          "Birth Date:": "تاريخ الميلاد:",
          "Personal Information": "المعلومات الشخصية",
          "Birth Place:": "مكان الميلاد:",
          "City:": "المدينة:",
          "Average Income:": "متوسط الدخل:",
          "0-500 NIS": "من 0-500 شيكل",
          "500-1000 NIS": "من 500-1000 شيكل",
          "1000-1500 NIS": "من 1000-1500 شيكل",
          "1500-2000 NIS": "من 1500-2000 شيكل",
          "2000-3000 NIS": "من 2000-3000 شيكل",
          "More than 3000 NIS": "أكثر من 3000 شيكل",
          "Gender:": "الجنس:",
          "Male": "ذكر",
          "Female": "أنثى",
          "Social Status:": "الحالة الإجتماعية:",
          "Single": "أعزب",
          "Married": "متزوج",
          "Save": "حفظ",
          "Contact Information": "معلومات الإتصال",
          "Telephone Number:": "رقم الهاتف:",
          "Mobile Phone Number:": "رقم المحمول:",
          "Education Information": "معلومات الدراسة",
          "High Scool Information:": "بيانات الثانوية العامة:",
          "Year of enrollment:": "سنة الإلتحاق:",
          "School:": "المدرسة:",
          "Grade:": "المعدل:",
          "Study Branch:": "فرع الدراسة:",
          "Study branch": "فرع الدراسة",
          "Scientific": "علمي",
          "Literary": "أدبي",
          "Commercial": "تجاري",
          "Industrial": "صناعي",
          "University Information:": "بيانات الجامعة:",
          "Undergraduate degree:": "الدرجة العلمية:",
          "Undergraduate degree": "الدرجة العلمية",
          "Diploma": "دبلوم",
          "BA": "بكالوريوس",
          "Master's": "ماجستير",
          "PhD": "دكتوراه",
          "University:": "الجامعة:",
          "College:": "الكلية:",
          "Department:": "التخصص:",
          "Academic Year:": "السنة الدراسية:",
          "Academic year": "السنة الدراسية",
          "First": "الأولى",
          "Second": "الثانية",
          "Third": "الثالتة",
          "Fourth": "الرابعة",
          "Fifth": "الخامسة",
          "Sixth": "السادسة",
          "Seventh": "السابعة",
          "GPA:": "المعدل التراكمي:",
          "University ID:": "الرقم الجامعي:",
          "ID Card:": "الهوية الشخصية:",
          "Pick File": "اختر ملف",
          "ID card of the head of the family, showing the family members:":
              "بطاقة هوية رب الأسرة ، ظاهراً فيها أفراد الأسرة:",
          "High school transcripts:": "كشف علامات الثانوية العامة:",
          "Student Card:": " بطاقة الطالب:",
          "Transcript for the last semester:": "كشف العلامات لآخر فصل دراسي :",
          "t1_a":
              "تقرير طبي مختوم من وزارة الصحة مبين فيه وصف الحالة الخاصة لكل حالة في حال وجود حالات خاصة",
          "t2_a":
              "شهادة من الشؤون الاجتماعية (حكومة، وكالة) في حال كنت حالة اجتماعية",
          "t3_a": "عقد ايجار قانوني لسكن العائلة اذا كان السكن ايجارا",
          "t4_a": "قسيمة راتب للاب/الزوج او الام/الزوجة في حال كانوا موظفين",
          "t5_a": "عقد ايجار قانوني لسكن الطالب اذا كان السكن ايجاراً",
          "t6_a":
              "شهادة وفاة لكل من (الاب/الزوج) و/او (الام/الزوجة) في حالة الوفاة",
          "t7_a":
              "شهادة اثبات طالب حديثة لكل طالب جامعي في اسرتك وبالنسبة للاخوة في النجاح صورة الهوية الجامعية فقط",
          "t1_f": " الرجاء تحري الدقة في إدخال البيانات خاصة رقم الهوية",
          "t2_f": " إذا لم تكن متزوجا/متزوجة لا تدخل بيانات الزوج/الزوجة",
          "t3_f":
              " في حال عدم إمتلاك بطاقة هوية، الرجاء إدخال رقم جواز السفر عوضا عن الهوية",
          "Section 1": "القسم الأول",
          "Section 2": "القسم الثاني",
          "Section 3": "القسم الثالث",
          "Student Name": "اسم الطالب",
          "Student Number": "رقم الطالب",
          "ID Number": "رقم الهوية",
          "Social Situation": "الوضع الإجتماعي",
          "Father": "الأب",
          "Quatrain Name ": "الإسم الرباعي       ",
          "ID Number         ": "رقم الهوية            ",
          "Career Status": "الوضع الوظيفي",
          "Works": "يعمل",
          "Does not work": "لا يعمل",
          "Prisoner": "أسير",
          "Retired": "متقاعد",
          "Aged/Sickly": "مسن / مريض",
          "Deceased": "متوفي",
          "Work Place": "مكان العمل",
          "The Ministry of Education and Higher Education":
              "وزارة التربية والتعليم العالي",
          "Ministry of Health": "وزارة الصحة",
          "The rest of the ministries": "باقي الوزارات",
          "Security Services": "الأجهزة الأمنية",
          "Not a government job": "ليست وظيفة حكومية",
          "Abroad": "في الخارج",
          "Job": "الوظيفة",
          "General Manager and above": "مدير عام فأعلى",
          "Administrator": "مدير",
          "Head of the Department": "رئيس قسم",
          "Employee": "موظف",
          "Teacher": "معلم",
          "Soldier": "عسكري",
          "Retired employee": "موظف متقاعد",
          "Merchant": "تاجر",
          "Contractor": "مقاول",
          "shopkeeper": "صاحب متجر",
          "Salesman in a shop": "بائع في متجر",
          "Peddler": "بائع متجول",
          "Free business": "أعمال حرة",
          "Poultry and livestock farming": "تربية الدواجن والماشية",
          "Hairdressing": "تصفيف الشعر",
          "Guard": "حارس",
          "Handicraft(marble, glass, crafting ..etc)":
              "الحرف اليدوية (الرخام ، الزجاج ، الصناعة .. إلخ)",
          "Maintenance (cars, electrical ..etc)":
              "صيانة (سيارات ، كهرباء .. إلخ)",
          "Driver": "سائق",
          "Plumber": "سباك",
          "Carpenter": "نجار",
          "Blacksmith": "حداد",
          "upholstery": "تنجيد",
          "Worker (construction, restaurants, factories, etc.)":
              "عامل (بناء ، مطاعم ، مصانع ، إلخ)",
          "Ironing clothes": "كوي الملابس",
          "Sewing": "خياطة",
          "Farmer": "مزارع",
          "Photographer": "مصور فوتوغرافي",
          "Graphic designer": "مصمم جرافيك",
          "Observer": "مراقب",
          "Technical": "فني",
          "Land survey": "مسح الأراضي",
          "Tour guide": "مرشد سياحي",
          "Sales Representative": "مندوب مبيعات",
          "Sales Supervisor": "مشرف مبيعات",
          "Nursery or Kindergarten": "حضانة أو رياض أطفال",
          "Athlete": "رياضي",
          "Librarian": "أمين مكتبة",
          "Secretary": "سكرتير",
          "Writer": "كاتب",
          "Translator": "مترجم",
          "Tax collection": "جابي",
          "Accountant": "محاسب",
          "Journalist": "صحفي",
          "Computer programmer": "مبرمج حاسوب",
          "Lawyer": "محامي",
          "Legal advisor": "مستشار قضائي",
          "Engineer": "مهندس",
          "Pharmacist": "صيدلي",
          "Nurse": "ممرض",
          "Optics": "بصريات",
          "Physical therapy": "علاج طبيعي",
          "Doctor": "طبيب",
          "Work Nature": "طبيعة العمل",
          "Job description  ": "وصف الوظيفة     ",
          "Mother": "الأم",
          "Owns a place/work tools": "يمتلك مكانًا / أدوات عمل",
          "Tenant of place/tools for work": "مستأجر مكان / أدوات للعمل",
          "Husband/Wife": "الزوج/الزوجة",
          "Parents' social status": "وضع الوالدين الإجتماعي",
          "Married1": "متزوجان",
          "One of them is dead": "أحدهما متوفي",
          "Separated": "مطلقان",
          "Other": "غير ذلك",
          "The funder of university costs": "الممول لتكاليف الجامعة",
          "Me personally": "أنا شخصيًا",
          "Relative Relation": "صلة القرابة",
          "relationship":
              "إذا كانت صلة القرابة غير ذلك ,الرجاء تعبئة البيانات التالية:",
          "Note:                 ": "ملاحظة:                 ",
          "family members": "عدد أفراد الأسرة يشمل الوالدين:",
          "university students": "عدد الطلبة الجامعيين في الأسرة:   ",
          "chronic diseases": "عدد أفراد الأسرة الذين يعانون من أمراض مزمنة:",
          "Family income": "دخل الأسرة بالشيكل شهريا:",
          "Above 10000": "أعلى من 10000",
          "assistance": "هل تمتلك الأسرة مساعدات كبطاقة شؤون أو زكاة؟",
          "No": "لا",
          "Yes": "نعم",
          "affairs card":
              "اذا كانت العائلة تمتلك بطاقة شؤون، ارجو ادخال رقم البطاقة:",
          "family housing": "سكن أسرة الطالب",
          "Property": "ملك",
          "Rent": "إيجار",
          "Live with another family without paying rent":
              "تقيم مع عائلة أخرى دون دفع إيجار",
          "monthly rent": "أجرة سكن الأسرة الشهري بالشيكل، إن وجد",
          "Above 3000": "أكثر من 3000",
          "Family residence": " إقامة الأسرة",
          "City": "مدينة",
          "Village": "قرية",
          "Camp": "مخيم",
          "vehicles": "عدد المركبات التي تمتلكها الأسرة :",
          "Private         ": "خصوصي      ",
          "Public           ": "عمومي         ",
          "Commercial ": "تجاري          ",
          "student housing": "أجرة سكن الطالب الشهري بالشيكل، إن وجد :",
          "Do you smoke ?": "هل أنت مدخن ؟",
          "Undergraduate fraternity data :": "بيانات الأخوة الجامعيين :",
          "Save data": "حفظ البيانات",
          "Registration number": "رقم التسجيل",
          "College Name": "اسم الكلية",
          "University Name": "اسم الجامعة",
          "Login Successful": "تم تسجيل الدخول بنجاح",
          "Email or Password Incorrect!":
              "البريد الإلكتروني أو كلمة المرور غير صحيحة!",
          "Registration Successful": "تم التسجيل بنجاح",
          "This User Already Exist!": "هذا المستخدم موجود بالفعل!",
          "Invalid Email Address": "عنوان البريد الإلكتروني غير صالح",
          "Email can not be empty": "لا يمكن أن يكون البريد الإلكتروني فارغًا",
          "Password Updated Successfully": "تم تحديث كلمة السر بنجاح",
          "Sent Successfully": "تم الإرسال بنجاح",
          "Failed to send!": "فشل في الإرسال!",
          "One of the text fields is empty!": "أحد الحقول النصية فارغ!",
          "*Required": "*مطلوب",
          "Reset": "إعادة تعيين",
          "Quatrain Name  ": "الإسم الرباعي        ",
          "Note                  ": "ملاحظة           ",
          "Married2": "متزوجان",
          "Something Else": "غير ذلك",
          "Saved": "تم حفظ البيانات بنجاح",
          "Updated!": "تم تحديث البيانات!",
          "Student #": "الطالب #",
          "x": "-1"
        },
        "en": {
          "User Name": "User Name",
          "E-mail": "E-mail",
          "Password": "Password",
          "Settings": "Settings",
          "Change Password": "Change Password",
          "Arabic": "Arabic",
          "English": "English",
          "Colse": "Colse",
          "Account": "Account",
          "Language": "Language",
          "Home": "Home",
          "Family Data": "Family Data",
          "Loan Request": "Loan Request",
          "Contact us": "Contact us",
          "Log out": "Log out",
          "Profile": "Profile",
          "Profile photo": "Choose Profile photo",
          "Camera": "Camera",
          "Gallery": "Gallery",
          "Notifications": "Notifications",
          "Content Settings": "Content Settings",
          "Social": "Social",
          "Privacy and Security": "Privacy and Security",
          "Theme Dark": "Theme Dark",
          "Account Active": "Account Active",
          "Opportunity": "Opportunity",
          "Contact Us": "Contact Us",
          "Name": "Name",
          "Subject": "Subject",
          "Email": "Email",
          "Message": "Message",
          "Send": "Send",
          "Create Account": "Create Account",
          "Sign up text":
              "Creating an account means you're okay with our Terms of Service and our Privacy Policy",
          "have an account": "Already have an account?",
          "Sign In": "Sign In",
          "Sign Up": "Sign Up",
          "Welcome!": "Welcome!",
          "Login": "Login",
          "Forget Password?": "Forget Password?",
          "Don't have an account?": "Don't have an account?",
          "Create": "Create",
          "Reset Password": "Reset Password",
          "Old password": "Old password",
          "New password": "New password",
          "Confirm": "Confirm",
          "Apply for a loan": "Apply for a loan",
          "t1_loan":
              "At the beginning of each semester, the Lending Fund announces the start of receiving loan applications for needy students in Palestinian higher education institutions for a specified period of time. The student wishing to submit a request must do the following:",
          "t2_loan": "1- Fill out the application through",
          "t3_loan": "through the student's account.",
          "t4_loan":
              "2- The student submits all the documents and supporting documents required of him to the Deanship of Student Affairs and his request is checked directly and he receives a proof of submission and verification form. In the event that the student does not complete this step, his request is considered incomplete and is not considered.",
          "t5_loan":
              "3- In the event the student loses his user name and/or password, he must refer to the Student Affairs Department at his educational institution to be provided with a new password.",
          "t6_loan": "the electronic services link",
          "Conditions for applying for a loan":
              "Conditions for applying for a loan",
          "t1_q":
              "1- The applicant must be a regular student in one of the higher education institutions in Palestine and financially needy (in the undergraduate or intermediate diploma program only).",
          "t2_q": "2- He must have successfully passed at least one semester.",
          "t3_q":
              "3- The student's cumulative academic average should not be less than 65% for undergraduate students and 60% for diploma students or its equivalent.",
          "t4_q":
              "4- That the student is not a beneficiary or holder of a university scholarship or a scholarship or financial aid from any other source that exceeds his needs.",
          "t5_q":
              "5- The candidate must have registered at least 12 credit hours in the semester in which he applied for the loan or grant.",
          "Notes:": "Notes:",
          "t6_q":
              "1- The percentage of opportunities that the student obtains is calculated based on the criteria of need, and the highest percentage that the student may obtain is 75% of the tuition fees only (without registration fees, internet...etc.)",
          "t7_q":
              "2- In addition to Note No. 1, the loan amount provided by the Fund does not exceed 1,000 Jordanian dinars in any case for one student in one semester.",
          "t8_q":
              "3- Parallel education students: their tuition fees are calculated according to the regular approved fees (not according to the prices of parallel studies).",
          "Personal Info": "Personal Info",
          "Contact Info": "Contact Info",
          "Educational Info": "Educational Info",
          "Attachments": "Attachments",
          "Person Information": "Person Information",
          "Full Name:": "Full Name:",
          "ID:": "ID:",
          "Birth Date:": "Birth Date:",
          "Personal Information": "Personal Information",
          "Birth Place:": "Birth Place:",
          "City:": "City:",
          "Average Income:": "Average Income:",
          "0-500 NIS": "0-500 NIS",
          "500-1000 NIS": "500-1000 NIS",
          "1000-1500 NIS": "1000-1500 NIS",
          "1500-2000 NIS": "1500-2000 NIS",
          "2000-3000 NIS": "2000-3000 NIS",
          "More than 3000 NIS": "More than 3000 NIS",
          "Gender:": "Gender:",
          "Male": "Male",
          "Female": "Female",
          "Social Status:": "Social Status:",
          "Single": "Single",
          "Married": "Married",
          "Save": "Save",
          "Contact Information": "Contact Information",
          "Telephone Number:": "Telephone Number:",
          "Mobile Phone Number:": "Mobile Phone Number:",
          "Education Information": "Education Information",
          "High Scool Information:": "High Scool Information:",
          "Year of enrollment:": "Year of enrollment:",
          "School:": "School:",
          "Grade:": "Grade:",
          "Study Branch:": "Study Branch:",
          "Study branch": "Study branch",
          "Scientific": "Scientific",
          "Literary": "Literary",
          "Commercial": "Commercial",
          "Industrial": "Industrial",
          "University Information:": "University Information:",
          "Undergraduate degree:": "Undergraduate degree:",
          "Undergraduate degree": "Undergraduate degree",
          "Diploma": "Diploma",
          "BA": "BA",
          "Master's": "Master's",
          "PhD": "PhD",
          "University:": "University:",
          "College:": "College:",
          "Department:": "Department:",
          "Academic Year:": "Academic Year:",
          "Academic year": "Academic year",
          "First": "First",
          "Second": "Second",
          "Third": "Third",
          "Fourth": "Fourth",
          "Fifth": "Fifth",
          "Sixth": "Sixth",
          "Seventh": "Seventh",
          "GPA:": "GPA:",
          "University ID:": "University ID:",
          "ID Card:": "ID Card:",
          "Pick File": "Pick File",
          "ID card of the head of the family, showing the family members:":
              "ID card of the head of the family, showing the family members:",
          "High school transcripts:": "High school transcripts:",
          "Student Card:": "Student Card:",
          "Transcript for the last semester:":
              "Transcript for the last semester:",
          "t1_a":
              "A medical report sealed by the Ministry of Health, showing the description of the special case for each case, if there are any special cases:",
          "t2_a":
              "Certificate from Social Affairs (government, agency) in case you are a social status:",
          "t3_a":
              "A legal lease contract for the family residence, if the housing is rented:",
          "t4_a":
              "Salary slip for father/husband or mother/wife if they are employed:",
          "t5_a":
              "A legal lease contract for the student housing if the housing is for rent:",
          "t6_a":
              "Death certificate for (father/husband) and/or (mother/wife) in case of death:",
          "t7_a":
              "A recent student proof certificate for each university student in your family, and for the brothers in success, a copy of the university ID only:",
          "t1_f":
              " Please be careful in entering the data, especially the ID number",
          "t2_f":
              " If you are not married, do not enter the data of the husband/wife",
          "t3_f":
              " If you do not have an ID card, please enter the passport number instead of the ID",
          "Section 1": "First Section",
          "Section 2": "Second Section",
          "Section 3": "Third Section",
          "Student Name": "Student Name",
          "Student Number": "Student Number",
          "ID Number": "ID Number",
          "Social Situation": "Social Situation",
          "Father": "Father",
          "Quatrain Name ": "Quatrain Name ",
          "ID Number         ": "ID Number         ",
          "Career Status": "Career Status",
          "Works": "Works",
          "Does not work": "Does not work",
          "Prisoner": "Prisoner",
          "Retired": "Retired",
          "Aged/Sickly": "Aged/Sickly",
          "Deceased": "Deceased",
          "Work Place": "Work Place",
          "The Ministry of Education and Higher Education":
              "The Ministry of Education and Higher Education",
          "Ministry of Health": "Ministry of Health",
          "The rest of the ministries": "The rest of the ministries",
          "Security Services": "Security Services",
          "Not a government job": "Not a government job",
          "Abroad": "Abroad",
          "Job": "Job",
          "General Manager and above": "General Manager and above",
          "Administrator": "Administrator",
          "Head of the Department": "Head of the Department",
          "Employee": "Employee",
          "Teacher": "Teacher",
          "Soldier": "Soldier",
          "Retired employee": "Retired employee",
          "Merchant": "Merchant",
          "Contractor": "Contractor",
          "shopkeeper": "shopkeeper",
          "Salesman in a shop": "Salesman in a shop",
          "Peddler": "Peddler",
          "Free business": "Free business",
          "Poultry and livestock farming": "Poultry and livestock farming",
          "Hairdressing": "Hairdressing",
          "Guard": "Guard",
          "Handicraft(marble, glass, crafting ..etc)":
              "Handicraft(marble, glass, crafting ..etc)",
          "Maintenance (cars, electrical ..etc)":
              "Maintenance (cars, electrical ..etc)",
          "Driver": "Driver",
          "Plumber": "Plumber",
          "Carpenter": "Carpenter",
          "Blacksmith": "Blacksmith",
          "upholstery": "upholstery",
          "Worker (construction, restaurants, factories, etc.)":
              "Worker (construction, restaurants, factories, etc.)",
          "Ironing clothes": "Ironing clothes",
          "Sewing": "Sewing",
          "Farmer": "Farmer",
          "Photographer": "Photographer",
          "Graphic designer": "Graphic designer",
          "Observer": "Observer",
          "Technical": "Technical",
          "Land survey": "Land survey",
          "Tour guide": "Tour guide",
          "Sales Representative": "Sales Representative",
          "Sales Supervisor": "Sales Supervisor",
          "Nursery or Kindergarten": "Nursery or Kindergarten",
          "Athlete": "Athlete",
          "Librarian": "Librarian",
          "Secretary": "Secretary",
          "Writer": "Writer",
          "Translator": "Translator",
          "Tax collection": "Tax collection",
          "Accountant": "Accountant",
          "Journalist": "Journalist",
          "Computer programmer": "Computer programmer",
          "Lawyer": "Lawyer",
          "Legal advisor": "Legal advisor",
          "Engineer": "Engineer",
          "Pharmacist": "Pharmacist",
          "Nurse": "Nurse",
          "Optics": "Optics",
          "Physical therapy": "Physical therapy",
          "Doctor": "Doctor",
          "Work Nature": "Work Nature",
          "Job description  ": "Job description  ",
          "Mother": "Mother",
          "Owns a place/work tools": "Owns a place/work tools",
          "Tenant of place/tools for work": "Tenant of place/tools for work",
          "Husband/Wife": "Husband/Wife",
          "Parents' social status": "Parents' social status",
          "Married1": "Married",
          "One of them is dead": "One of them is dead",
          "Separated": "Separated",
          "Other": "Other",
          "The funder of university costs": "The funder of university costs",
          "Me personally": "Me personally",
          "Relative Relation": "Relative Relation",
          "relationship":
              "If the relationship is other, please fill in the following data:",
          "Note:                 ": "Note:                 ",
          "family members": "Number of family members including parents :",
          "university students":
              "Number of university students in the family :    ",
          "chronic diseases":
              "Number of family members with chronic diseases :",
          "Family income": "Family income in shekels per month :",
          "Above 10000": "Above 10000",
          "assistance":
              "Does the family have assistance such as a business card or zakat?",
          "Yes": "Yes",
          "No": "No",
          "affairs card":
              "If the family has an affairs card, please enter the card number :",
          "family housing": "Student family housing",
          "Property": "Property",
          "Rent": "Rent",
          "Live with another family without paying rent":
              "Live with another family without paying rent",
          "monthly rent":
              "The monthly rent for the family housing in shekels, if any",
          "Above 3000": "Above 3000",
          "Family residence": "Family residence",
          "City": "City",
          "Village": "Village",
          "Camp": "Camp",
          "vehicles": "The number of vehicles the family owns :",
          "Private         ": "Private         ",
          "Public           ": "Public           ",
          "Commercial ": "Commercial ",
          "student housing":
              "The monthly student housing fee in shekels, if any :",
          "Do you smoke ?": "Do you smoke ?",
          "Undergraduate fraternity data :": "Undergraduate fraternity data :",
          "Save data": "Save data",
          "Registration number": "Registration number",
          "College Name": "College Name",
          "University Name": "University Name",
          "Login Successful": "Login Successful",
          "Email or Password Incorrect!": "Email or Password Incorrect!",
          "Registration Successful": "Registration Successful",
          "This User Already Exist!": "This User Already Exist!",
          "Invalid Email Address": "Invalid Email Address",
          "Email can not be empty": "Email can not be empty",
          "Password Updated Successfully": "Password Updated Successfully",
          "Sent Successfully": "Sent Successfully",
          "Failed to send!": "Failed to send!",
          "One of the text fields is empty!":
              "One of the text fields is empty!",
          "*Required": "*Required",
          "Reset": "Reset",
          "Quatrain Name  ": "Quatrain Name  ",
          "Note                  ": "Note                  ",
          "Married2": "Married",
          "Something Else": "Something Else",
          "Saved": "Data saved successfully",
          "Updated!": "The data has been updated!",
          "Student #": "Student #",
          "x": "1"
        }
      };
}
