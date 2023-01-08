class CommitStateModel {
  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  Null? author;
  Null? committer;
  List<Parents>? parents;
  Stats? stats;
  List<Files>? files;

  CommitStateModel(
      {this.sha,
      this.nodeId,
      this.commit,
      this.url,
      this.htmlUrl,
      this.commentsUrl,
      this.author,
      this.committer,
      this.parents,
      this.stats,
      this.files});

  CommitStateModel.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit =
        json['commit'] != null ? new Commit.fromJson(json['commit']) : null;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author = json['author'];
    committer = json['committer'];
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(new Parents.fromJson(v));
      });
    }
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['node_id'] = this.nodeId;
    if (this.commit != null) {
      data['commit'] = this.commit!.toJson();
    }
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['comments_url'] = this.commentsUrl;
    data['author'] = this.author;
    data['committer'] = this.committer;
    if (this.parents != null) {
      data['parents'] = this.parents!.map((v) => v.toJson()).toList();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commit {
  Author? author;
  Author? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  Commit(
      {this.author,
      this.committer,
      this.message,
      this.tree,
      this.url,
      this.commentCount,
      this.verification});

  Commit.fromJson(Map<String, dynamic> json) {
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? new Author.fromJson(json['committer'])
        : null;
    message = json['message'];
    tree = json['tree'] != null ? new Tree.fromJson(json['tree']) : null;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? new Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.committer != null) {
      data['committer'] = this.committer!.toJson();
    }
    data['message'] = this.message;
    if (this.tree != null) {
      data['tree'] = this.tree!.toJson();
    }
    data['url'] = this.url;
    data['comment_count'] = this.commentCount;
    if (this.verification != null) {
      data['verification'] = this.verification!.toJson();
    }
    return data;
  }
}

class Author {
  String? name;
  String? email;
  String? date;

  Author({this.name, this.email, this.date});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['date'] = this.date;
    return data;
  }
}

class Tree {
  String? sha;
  String? url;

  Tree({this.sha, this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['url'] = this.url;
    return data;
  }
}

class Verification {
  bool? verified;
  String? reason;
  Null? signature;
  Null? payload;

  Verification({this.verified, this.reason, this.signature, this.payload});

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
    signature = json['signature'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['reason'] = this.reason;
    data['signature'] = this.signature;
    data['payload'] = this.payload;
    return data;
  }
}

class Parents {
  String? sha;
  String? url;
  String? htmlUrl;

  Parents({this.sha, this.url, this.htmlUrl});

  Parents.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}

class Stats {
  int? total;
  int? additions;
  int? deletions;

  Stats({this.total, this.additions, this.deletions});

  Stats.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    additions = json['additions'];
    deletions = json['deletions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['additions'] = this.additions;
    data['deletions'] = this.deletions;
    return data;
  }
}

class Files {
  String? sha;
  String? filename;
  String? status;
  int? additions;
  int? deletions;
  int? changes;
  String? blobUrl;
  String? rawUrl;
  String? contentsUrl;
  String? patch;

  Files(
      {this.sha,
      this.filename,
      this.status,
      this.additions,
      this.deletions,
      this.changes,
      this.blobUrl,
      this.rawUrl,
      this.contentsUrl,
      this.patch});

  Files.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    filename = json['filename'];
    status = json['status'];
    additions = json['additions'];
    deletions = json['deletions'];
    changes = json['changes'];
    blobUrl = json['blob_url'];
    rawUrl = json['raw_url'];
    contentsUrl = json['contents_url'];
    patch = json['patch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['filename'] = this.filename;
    data['status'] = this.status;
    data['additions'] = this.additions;
    data['deletions'] = this.deletions;
    data['changes'] = this.changes;
    data['blob_url'] = this.blobUrl;
    data['raw_url'] = this.rawUrl;
    data['contents_url'] = this.contentsUrl;
    data['patch'] = this.patch;
    return data;
  }
}
