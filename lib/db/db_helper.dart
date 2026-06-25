import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get db async {
    _db ??= await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'tastoo.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('CREATE TABLE customers(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, balance REAL)');
        await db.execute('CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, price REAL, stock INTEGER)');
        await db.execute('CREATE TABLE invoices(id INTEGER PRIMARY KEY, customer TEXT, total REAL, date TEXT)');
        await db.execute('CREATE TABLE payments(id INTEGER PRIMARY KEY, customer TEXT, amount REAL, date TEXT)');
        await db.execute('CREATE TABLE ledger(id INTEGER PRIMARY KEY, customer TEXT, debit REAL, credit REAL, balance REAL, date TEXT)');
      },
    );
  }

  // CUSTOMERS
  static Future insertCustomer(Map<String, dynamic> data) async {
    final dbClient = await db;
    return dbClient.insert('customers', data);
  }

  static Future<List<Map<String, dynamic>>> getCustomers() async {
    final dbClient = await db;
    return dbClient.query('customers');
  }

  // PRODUCTS
  static Future insertProduct(Map<String, dynamic> data) async {
    final dbClient = await db;
    return dbClient.insert('products', data);
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final dbClient = await db;
    return dbClient.query('products');
  }

  // INVOICES
  static Future insertInvoice(Map<String, dynamic> data) async {
    final dbClient = await db;
    return dbClient.insert('invoices', data);
  }

  static Future<List<Map<String, dynamic>>> getInvoices() async {
    final dbClient = await db;
    return dbClient.query('invoices');
  }

  // PAYMENTS
  static Future insertPayment(Map<String, dynamic> data) async {
    final dbClient = await db;
    return dbClient.insert('payments', data);
  }

  static Future<List<Map<String, dynamic>>> getPayments() async {
    final dbClient = await db;
    return dbClient.query('payments');
  }
}
