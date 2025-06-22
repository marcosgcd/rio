import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

void main() {
  runApp(const BottomNavigationStandaloneApp());
}

class BottomNavigationStandaloneApp extends StatelessWidget {
  const BottomNavigationStandaloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rio Bottom Navigation Example',
      debugShowCheckedModeBanner: false,
      theme: RioTheme(
        colorScheme: RioColorScheme.fromSeed(Colors.blue),
      ).toThemeData(),
      home: const BottomNavigationExample(),
    );
  }
}

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({super.key});

  @override
  State<BottomNavigationExample> createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int currentIndex = 0;
  static const String heroTag = 'action-button';

  final List<RioBottomNavigationItem> items = const [
    RioBottomNavigationItem(
      label: 'Home',
      icon: Icon(Icons.home),
      tooltip: 'Home',
    ),
    RioBottomNavigationItem(
      label: 'Search',
      icon: Icon(Icons.search),
      tooltip: 'Search',
    ),
    RioBottomNavigationItem(
      label: 'Profile',
      icon: Icon(Icons.person),
      tooltip: 'Profile',
    ),
    RioBottomNavigationItem(
      label: 'Settings',
      icon: Icon(Icons.settings),
      tooltip: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rio Bottom Navigation'),
        backgroundColor: RioTheme.of(context).colorScheme.primary,
        foregroundColor: RioTheme.of(context).colorScheme.onPrimary,
      ),
      body: _buildBody(),
      bottomNavigationBar: RioBottomNavigation(
        items: items,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        actionBuilder: (context, index) {
          switch (index) {
            case 0: // Home - Menu action
              return RioBottomNavigationAction(
                onPressed: (context) async {
                  final result = await showRioMenu(
                    context,
                    direction: RioPopoverDirection.top,
                    items: [
                      RioMenuItem<String>(
                        title: const Text("New Post"),
                        value: "new_post",
                      ),
                      RioMenuItem<String>(
                        title: const Text("New Story"),
                        value: "new_story",
                      ),
                      RioMenuItem<String>(
                        title: const Text("New Album"),
                        value: "new_album",
                      ),
                    ],
                  );

                  if (result != null && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: $result')),
                    );
                  }
                },
                tooltip: 'Add content',
                child: const Icon(Icons.add),
                buttonTheme: RioButtonTheme(
                  variant: RioButtonVariant.soft,
                  color: RioTheme.of(context).colorScheme.primary,
                ),
                containerTheme: const RioContainerTheme(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              );

            case 1: // Search - Simple action
              return RioBottomNavigationAction(
                onPressed: (context) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search action pressed')),
                  );
                },
                tooltip: 'Search',
                child: const Icon(Icons.search),
                buttonTheme: const RioButtonTheme(
                  variant: RioButtonVariant.soft,
                  color: Colors.green,
                ),
                containerTheme: const RioContainerTheme(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              );

            case 2: // Profile - Hero dialog
              return RioBottomNavigationAction(
                heroTag: heroTag,
                createRectTween: (begin, end) => CustomRectTween(
                  begin: begin,
                  end: end,
                ),
                tooltip: 'Edit profile',
                child: const Icon(Icons.edit),
                buttonTheme: const RioButtonTheme(
                  variant: RioButtonVariant.soft,
                  color: Colors.orange,
                ),
                containerTheme: const RioContainerTheme(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                dialogBuilder: (context) => RioContainer(
                  theme: RioContainerTheme(
                    color: RioTheme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.edit,
                          size: 48,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Edit Profile',
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'This dialog opened with a smooth Hero animation from the action button!',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RioButton(
                              theme: const RioButtonTheme(
                                variant: RioButtonVariant.outlined,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel'),
                            ),
                            RioButton(
                              theme: const RioButtonTheme(
                                variant: RioButtonVariant.soft,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Profile updated!'),
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );

            case 3: // Settings - No action button
            default:
              return null;
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildSearchTab();
      case 2:
        return _buildProfileTab();
      case 3:
        return _buildSettingsTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: 80,
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the + button to see a menu with multiple options.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '(Demonstrates: Menu action)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 80,
            color: Colors.green,
          ),
          SizedBox(height: 16),
          Text(
            'Search',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the search button for a simple action.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '(Demonstrates: Simple action)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the edit button to see a hero dialog animation.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '(Demonstrates: Hero dialog)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.settings,
            size: 80,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'No action button on this tab.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '(Demonstrates: No action)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: null,
                ),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Dark Mode'),
                trailing: Switch(
                  value: false,
                  onChanged: null,
                ),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                trailing: Text('English'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
