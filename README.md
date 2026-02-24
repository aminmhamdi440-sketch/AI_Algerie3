# 🇩🇿 Algeria Intelligence Titan Enterprise v6.0

## 📋 نظرة عامة

منصة تعليمية متقدمة تجمع بين الذكاء الاصطناعي المتعدد والألعاب والبرمجة. مشروع جزائري يهدف إلى توفير منصة تعليمية عالمية الجودة.

**الحالة:** ✅ جاهز للتطوير والاختبار | 🚀 قريب من الإنتاج

---

## ⭐ الميزات الرئيسية

### 🤖 دعم نماذج الذكاء الاصطناعي المتعددة
- **OpenAI GPT-4o-mini** - أداء عالي وسرعة
- **DeepSeek** - تحليل عميق ومنطق قوي
- **Claude 3 Haiku** - فهم طبيعي اللغة

### 🎮 نظام الألعاب والتحفيز
- نظام XP والمستويات
- نظام الإنجازات (Achievements)
- تأثيرات احتفالية (Confetti)
- لوحة المتصدرين (Leaderboard)

### 💬 جلسات محادثة متقدمة
- حفظ جلسات المحادثة تلقائياً
- استرجاع سجل المحادثات
- دعم Pagination
- حفظ محلي (localStorage)

### 🛒 متجر وسلة التسوق
- نظام المتجر المدمج
- إدارة السلة
- بيانات منتجات ديناميكية

### 💻 Lab للبرمجة
- محرر أكواد متقدم (Monaco Editor)
- إبراز الأكواد (Syntax Highlighting)
- دعم لغات برمجية متعددة

---

## 🏗️ البنية المعمارية

### Backend (Node.js + Express)
```
backend/
├── server.js              # API Gateway الرئيسي
├── services/
│   └── ai.service.js     # خدمات الذكاء الاصطناعي
├── controllers/
│   └── chat.controller.js # معالج المحادثات
├── prisma/
│   └── schema.prisma     # نموذج قاعدة البيانات
├── .env                  # متغيرات البيئة
└── package.json          # Dependencies
```

### Frontend (Next.js + React + TypeScript)
```
frontend/
├── app/
│   ├── page.tsx          # الصفحة الرئيسية
│   ├── layout.tsx        # التخطيط العام
│   ├── lab/              # صفحة Lab
│   └── store/            # صفحة المتجر
├── components/           # المكونات الأساسية
├── context/              # Context APIs (Gamification, Cart)
└── utils/                # دوال مساعدة
```

---

## 🚀 التحسينات الجديدة (v6.0)

### ✅ تم تطبيقها

1. **إصلاح Dockerfile** ✓
   - تم حذف الأخطاء
   - تحسين البناء متعدد المراحل

2. **تحسينات الأمان** ✓
   - إزالة البيانات الحساسة من الكود
   - إضافة `.env.example`
   - تحسين validation schemas

3. **Health Check Endpoint** ✓
   ```bash
   GET /health
   ```

4. **نظام الجلسات (Chat Sessions)** ✓
   - حفظ جلسات المحادثة
   - API للقائمة والإنشاء
   - دعم في Frontend

5. **نظام الإنجازات (Achievements)** ✓
   - نموذج قاعدة بيانات
   - API للاسترجاع
   - جاهز للربط مع Frontend

6. **Leaderboard System** ✓
   ```bash
   GET /api/leaderboard
   ```

7. **تحسين Claude API** ✓
   - تطبيق كامل لـ Claude
   - معالجة الأخطاء الصحيحة

8. **Session Management** ✓
   - حفظ آخر دخول
   - عداد عمليات الدخول
   - Subscription Tiers

9. **Graceful Shutdown** ✓
   - معالجة SIGTERM و SIGINT
   - قطع الاتصال الآمن بقاعدة البيانات

10. **localStorage للمحادثات** ✓
    - حفظ تلقائي للمحادثات
    - استرجاع المحادثات القديمة

---

## 📦 المتطلبات

### Backend
```bash
Node.js 20+
npm أو yarn
```

### Dependencies
```json
{
  "express": "^4.18.2",
  "@prisma/client": "^5.0.0",
  "jsonwebtoken": "^9.0.2",
  "bcryptjs": "^2.4.3",
  "cors": "^2.8.5",
  "helmet": "^7.1.0",
  "zod": "^4.3.6",
  "redis": "^4.6.10"
}
```

---

## 🔧 التثبيت والتشغيل

### 1. استنساخ المشروع
```bash
git clone https://github.com/your-repo/titan.git
cd titan
```

### 2. إعداد البيئة

#### Backend
```bash
cd backend
cp .env.example .env
# قم بتحرير .env بمفاتيح API الحقيقية
npm install
```

#### Frontend
```bash
cd frontend
cp .env.example .env.local
npm install
```

### 3. التشغيل

#### في بيئة التطوير

**Option 1: منفصل**
```bash
# Terminal 1: Backend
cd backend
npm run dev

# Terminal 2: Frontend
cd frontend
npm run dev
```

**Option 2: Docker Compose**
```bash
docker compose up -d --build
```

### 4. الوصول للتطبيق
- **Frontend:** http://localhost:3001
- **API Gateway:** http://localhost:3000
- **Health Check:** http://localhost:3000/health

---

## 🔐 متغيرات البيئة الحرجة

```bash
# معرفات الخدمات (مطلوب)
OPENAI_API_KEY=sk-...
DEEPSEEK_API_KEY=...
ANTHROPIC_API_KEY=...

# قاعدة البيانات (تطوير vs إنتاج)
# التطوير:
DATABASE_URL="file:./dev.db"
# الإنتاج:
DATABASE_URL="postgresql://user:pass@postgres:5432/titan"

# الأمان
JWT_SECRET="secure-random-key-change-me"
NODE_ENV="development"
```

---

## 📊 API Endpoints

### Authentication
```
POST   /api/auth/register    # تسجيل جديد
POST   /api/auth/login       # دخول
```

### Chat Sessions
```
GET    /api/chat/sessions    # قائمة الجلسات
POST   /api/chat/sessions    # إنشاء جلسة جديدة
```

### AI Service
```
GET    /api/ai/history       # سجل المحادثات (مع Pagination)
POST   /api/ai/ask           # إرسال سؤال للـ AI (Streaming)
```

### Gamification
```
GET    /api/achievements     # قائمة الإنجازات
GET    /api/leaderboard      # لوحة المتصدرين
```

### Utility
```
GET    /health               # فحص صحة الخادم
```

---

## 🧪 الاختبار

### Backend Tests
```bash
npm run test
```

### API Testing (Postman)
- رابط الـ Collection: [متوفر قريباً]

---

## 🛠️ التطوير المستقبلي

### قريب (أسبوع)
- [ ] إضافة Unit Tests
- [ ] تطبيق Redis Caching
- [ ] Logging محسّن مع Winston

### متوسط (شهر)
- [ ] Dark/Light Theme في Frontend
- [ ] Voice Input (Speech-to-Text)
- [ ] Notifications System

### بعيد (ربع)
- [ ] Mobile App (React Native)
- [ ] Advanced Analytics
- [ ] Multi-language Support

---

## 🐛 معالجة الأخطاء

### الأخطاء الشائعة

**خطأ: API key not found**
```bash
# الحل:
# 1. تأكد من .env يحتوي على المفاتيح
# 2. استخدم .env.example كقالب
```

**خطأ: Database connection failed**
```bash
# الحل:
# 1. تحقق من DATABASE_URL
# 2. للـ SQLite: تأكد من المسار
# 3. للـ PostgreSQL: تحقق من الاتصال
```

---

## 📞 الدعم والمساهمة

- **Issues:** [GitHub Issues](your-github-url)
- **Email:** contact@titan.dz
- **Discord:** [رابط السيرفر]

---

## 📄 الترخيص

MIT License - انظر [LICENSE](LICENSE) للتفاصيل

---

## 👥 الفريق

- **المطورون:** الفريق الجزائري للتكنولوجيا
- **المدير:** دعم المشروع الجزائري

---

## 🇩🇿 حول المشروع

**ذكاء الجزائر - تيتان** هو مشروع وطني يهدف إلى:
- توفير منصة تعليمية عالمية
- دعم الذكاء الاصطناعي المحلي
- تشجيع الشباب على البرمجة والتعلم
- بناء مجتمع تقني قوي

**الشعار:** 🇩🇿 الجزائر تقود الرقمية 🚀

---

**آخر تحديث:** 17 فبراير 2026 | **الإصدار:** 6.0.0
