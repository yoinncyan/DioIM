class User {
  final int? id;
  final String name;
  final String? password;
  final String? phone;
  final String? email;
  final String? salt;
  final String? identity;
  final String? loginTime;
  final String? heartbeatTime;
  final String? logoutTime;
  final bool? isLogout;
  final String? deviceInfo;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  User({
    this.id,
    required this.name,
    this.password,
    this.phone,
    this.email,
    this.salt,
    this.identity,
    this.loginTime,
    this.heartbeatTime,
    this.logoutTime,
    this.isLogout,
    this.deviceInfo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // 从 JSON 创建 User 对象
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'] as int?,
      name: json['name'] as String? ?? '',
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      salt: json['salt'] as String?,
      identity: json['identity'] as String?,
      loginTime: json['login_time'] as String?,
      heartbeatTime: json['heartbeat_time'] as String?,
      logoutTime: json['logout_time'] as String?,
      isLogout: json['is_logout'] as bool?,
      deviceInfo: json['device_info'] as String?,
      createdAt: json['CreatedAt'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
      deletedAt: json['DeletedAt'] as String?,
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'name': name,
      'password': password,
      'phone': phone,
      'email': email,
      'salt': salt,
      'identity': identity,
      'login_time': loginTime,
      'heartbeat_time': heartbeatTime,
      'logout_time': logoutTime,
      'is_logout': isLogout,
      'device_info': deviceInfo,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
      'DeletedAt': deletedAt,
    };
  }

  // 复制对象并更新指定字段
  User copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? email,
    String? salt,
    String? identity,
    String? loginTime,
    String? heartbeatTime,
    String? logoutTime,
    bool? isLogout,
    String? deviceInfo,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      salt: salt ?? this.salt,
      identity: identity ?? this.identity,
      loginTime: loginTime ?? this.loginTime,
      heartbeatTime: heartbeatTime ?? this.heartbeatTime,
      logoutTime: logoutTime ?? this.logoutTime,
      isLogout: isLogout ?? this.isLogout,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, email: $email)';
  }
}

