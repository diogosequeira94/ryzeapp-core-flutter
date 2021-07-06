class StringsGetter {
  static String getCategoryDescription(String category) {
    switch (category) {
      case 'All':
        return 'Every job we have will be showed under this section. If you are searching for a particular job, you opt by selecting a category.';
      case 'Bar':
        return 'Preparing alcoholic or non-alcoholic beverages for bar and patrons. Interacting with customers, taking orders and serving snacks and drinks. Assessing bar customers needs and preferences and making recommendations.';
      case 'Chef':
        return 'A Chef or Cook is responsible for using their culinary expertise to create appetizing dishes for diners to enjoy. Their duties include overseeing kitchen staff, tasting dishes before going to customers and restocking food produce as needed.';
      case 'Hotel':
        return 'Hotel responsibilities include registering guests, managing reservations and providing information about rooms, rates and amenities.';
      case 'IT':
        return 'Installing and configuring computer hardware, software, systems, networks, printers, and scanners. Monitoring and maintaining computer systems and networks.';
      case 'Remote':
        return 'It can be anything as long as you do not need to be physically present.';
      case 'Support':
        return 'Assisting with domestic tasks including shopping, cooking, cleaning, and washing. Tending to the healthcare needs of each client.';
      default:
        return '';
    }
  }
}
