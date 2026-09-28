import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tasbeh_state.dart';

class TasbehCubit extends Cubit<TasbehState> {
  TasbehCubit() : super(TasbehInitial());

  final List<String> tasbeh = [
    "سُبْحَانَ اللَّهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ",
    "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
    "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
    "أستغفر الله",
    "سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ",
    "لَا إِلَهَ إِلَّا اللَّهُ",
    "الْلَّهُ أَكْبَرُ",
    "سُبْحَانَ اللَّهِ ، وَالْحَمْدُ لِلَّهِ ، وَلا إِلَهَ إِلا اللَّهُ ، وَاللَّهُ أَكْبَرُ",
    "الْحَمْدُ لِلَّهِ حَمْدًا كَثِيرًا طَيِّبًا مُبَارَكًا فِيهِ",
    "اللَّهُ أَكْبَرُ كَبِيرًا ، وَالْحَمْدُ لِلَّهِ كَثِيرًا ، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلاً.",
    "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ، وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ",
  ];

  void increment() {
    if (state.count == 31) {
      emit(
        TasbehState(
          count: 0,
          round: state.round + 1,
          tasbehIndex: state.tasbehIndex,
        ),
      );
    } else {
      emit(
        TasbehState(
          count: state.count + 1,
          round: state.round,
          tasbehIndex: state.tasbehIndex,
        ),
      );
    }
  }

  void reset() {
    emit(TasbehInitial());
  }

  void nextTasbeh() {
    int index = state.tasbehIndex + 1;

    if (index == tasbeh.length) {
      index = 0;
    }

    emit(
      TasbehState(
        count: state.count,
        round: state.round,
        tasbehIndex: index,
      ),
    );
  }

  void previousTasbeh() {
    int index = state.tasbehIndex - 1;

    if (index < 0) {
      index = tasbeh.length - 1;
    }

    emit(
      TasbehState(
        count: state.count,
        round: state.round,
        tasbehIndex: index,
      ),
    );
  }
}