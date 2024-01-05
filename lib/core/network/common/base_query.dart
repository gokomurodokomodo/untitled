abstract class BaseQuery {
  Map<String, String> get toQuery;
}

// For increasing page and limit query
// if total element = 50, page count from 1
// page = 1, limit = 20 => first 20 items
// page = 2, limit = 20 => next 20 items
// page = 3, limit = 20 => last 10 items
// page = 1, limit = 50 => all 50 items
class PageQuery extends BaseQuery {
  final int page;
  final int limit;

  PageQuery(this.page, this.limit);

  @override
  Map<String, String> get toQuery => {
    'page': page.toString(),
    'limit': limit.toString()
  };
}