.class public Lcom/sisensing/sisensingcgm/Aab;
.super Ljava/lang/Object;
.source "Aab.java"


# static fields
.field public static volatile Instance:Lcom/sisensing/sisensingcgm/Aab; = null

.field public static final MMOLL_TO_MGDL:D = 18.0182

.field public static volatile bFirstTime:Z


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const/4 v0, 0x1

    sput-boolean v0, Lcom/sisensing/sisensingcgm/Aab;->bFirstTime:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/sisensing/sisensingcgm/Aab;->mContext:Landroid/content/Context;

    .line 27
    return-void
.end method

.method public static g(Landroid/content/Context;)Lcom/sisensing/sisensingcgm/Aab;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 30
    sget-object v0, Lcom/sisensing/sisensingcgm/Aab;->Instance:Lcom/sisensing/sisensingcgm/Aab;

    if-nez v0, :cond_1

    .line 31
    const-class v0, Lcom/sisensing/sisensingcgm/Aab;

    monitor-enter v0

    .line 32
    :try_start_0
    sget-object v1, Lcom/sisensing/sisensingcgm/Aab;->Instance:Lcom/sisensing/sisensingcgm/Aab;

    if-nez v1, :cond_0

    .line 33
    new-instance v1, Lcom/sisensing/sisensingcgm/Aab;

    invoke-direct {v1, p0}, Lcom/sisensing/sisensingcgm/Aab;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/sisensing/sisensingcgm/Aab;->Instance:Lcom/sisensing/sisensingcgm/Aab;

    .line 35
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 37
    :cond_1
    :goto_0
    sget-object v0, Lcom/sisensing/sisensingcgm/Aab;->Instance:Lcom/sisensing/sisensingcgm/Aab;

    return-object v0
.end method

.method private static getSlopeName(I)Ljava/lang/String;
    .locals 2
    .param p0, "trend"    # I

    .line 41
    const-string v0, ""

    .line 42
    .local v0, "slopeName":Ljava/lang/String;
    if-nez p0, :cond_0

    .line 43
    const-string v0, "Flat"

    goto :goto_0

    .line 44
    :cond_0
    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    .line 45
    const-string v0, "FortyFiveUp"

    goto :goto_0

    .line 46
    :cond_1
    const/4 v1, 0x2

    if-ne p0, v1, :cond_2

    .line 47
    const-string v0, "SingleUp"

    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, -0x1

    if-ne p0, v1, :cond_3

    .line 49
    const-string v0, "FortyFiveDown"

    goto :goto_0

    .line 50
    :cond_3
    const/4 v1, -0x2

    if-ne p0, v1, :cond_4

    .line 51
    const-string v0, "SingleDown"

    goto :goto_0

    .line 52
    :cond_4
    const/4 v1, 0x3

    if-ne p0, v1, :cond_5

    .line 53
    const-string v0, "DoubleUp"

    goto :goto_0

    .line 54
    :cond_5
    const/4 v1, -0x3

    if-ne p0, v1, :cond_6

    .line 55
    const-string v0, "DoubleDown"

    .line 57
    :cond_6
    :goto_0
    return-object v0
.end method


# virtual methods
.method public s(Lcom/sisensing/common/entity/BloodGlucoseEntity/BloodGlucoseEntity;)V
    .locals 11
    .param p1, "cgmData"    # Lcom/sisensing/common/entity/BloodGlucoseEntity/BloodGlucoseEntity;

    .line 64
    const-string v0, "device"

    const-string v1, "sgv"

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 65
    .local v2, "jSONArray":Lorg/json/JSONArray;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 66
    .local v3, "jSONObject":Lorg/json/JSONObject;
    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.eveningoutpost.dexdrip.SI_APP"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 67
    .local v4, "intent":Landroid/content/Intent;
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 68
    iget-object v5, p0, Lcom/sisensing/sisensingcgm/Aab;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const-string v6, "LJW"

    if-eqz v5, :cond_0

    .line 69
    const-string v0, "No xDrip receivers found."

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    return-void

    .line 72
    :cond_0
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 74
    .local v5, "bundle":Landroid/os/Bundle;
    :try_start_0
    invoke-virtual {p1}, Lcom/sisensing/common/entity/BloodGlucoseEntity/BloodGlucoseEntity;->getGlucoseValue()F

    move-result v7

    float-to-double v7, v7

    const-wide v9, 0x403204a8c154c986L    # 18.0182

    mul-double/2addr v7, v9

    invoke-virtual {v3, v1, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 75
    const-string v7, "direction"

    invoke-virtual {p1}, Lcom/sisensing/common/entity/BloodGlucoseEntity/BloodGlucoseEntity;->getGlucoseTrend()I

    move-result v8

    invoke-static {v8}, Lcom/sisensing/sisensingcgm/Aab;->getSlopeName(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v7, "\u7845\u57fa"

    invoke-virtual {v3, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    const-string v7, "type"

    invoke-virtual {v3, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    const-string v1, "date"

    invoke-virtual {p1}, Lcom/sisensing/common/entity/BloodGlucoseEntity/BloodGlucoseEntity;->getProcessedTimeMill()J

    move-result-wide v7

    invoke-virtual {v3, v1, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 79
    const-string v1, "dateString"

    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyy-MM-dd HH:mm:ss Z"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {p1}, Lcom/sisensing/common/entity/BloodGlucoseEntity/BloodGlucoseEntity;->getProcessedTimeMill()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 84
    const-string v7, "action"

    const-string v8, "add"

    invoke-virtual {v5, v7, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string v7, "manongCode"

    const-string v8, "magic372manongxyes"

    invoke-virtual {v5, v7, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string v7, "SIAppPatched"

    invoke-virtual {v5, v0, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string v0, "collection"

    const-string v7, "entries"

    invoke-virtual {v5, v0, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    const-string v0, "data"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v0, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v4, v5}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 90
    iget-object v0, p0, Lcom/sisensing/sisensingcgm/Aab;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .end local v1    # "stringBuilder":Ljava/lang/StringBuilder;
    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "jSONException":Lorg/json/JSONException;
    const-string v1, "Unhandled exception"

    invoke-static {v6, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 95
    .end local v0    # "jSONException":Lorg/json/JSONException;
    :goto_0
    return-void
.end method
