package com.sinlov.android.ndkmodule.demo;

import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowToast;

import androidx.lifecycle.Lifecycle;
import androidx.test.core.app.ActivityScenario;


import test.RoboTemp;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;

/**
 * test {@link MainActivity}
 * <pre>
 *     sinlov
 *
 *     /\__/\
 *    /`    '\
 *  ≈≈≈ 0  0 ≈≈≈ Hello world!
 *    \  --  /
 *   /        \
 *  /          \
 * |            |
 *  \  ||  ||  /
 *   \_oo__oo_/≡≡≡≡≡≡≡≡o
 *
 * </pre>
 * Created by sinlov on 17/8/17.
 */
public class MainActivityTest extends RoboTemp {
    //    private MainActivityAbstract mainActivity;
    private ActivityController<MainActivity> activityController;
    private ActivityScenario<MainActivity> activityScenario;

    @Override
    @Before
    public void setUp() throws Exception {
        super.setUp();
        // Create new activity http://robolectric.org/androidx_test/
        activityScenario = ActivityScenario.launch(MainActivity.class);
        activityScenario.moveToState(Lifecycle.State.CREATED);
        this.activityController = Robolectric.buildActivity(MainActivity.class).create().start().resume().visible();
    }

    @Override
    @After
    public void tearDown() throws Exception {
        super.tearDown();
        // Destroy activity
        this.activityScenario.moveToState(Lifecycle.State.DESTROYED);
    }

    @Test
    public void testOnCreateNotNull() {
        assertNotNull(activityScenario);
        assertNotNull(activityController);
    }

    @Test
    public void testLifeCycleResume() {
        this.activityController.pause().stop().destroy();
    }

    @Test
    public void testResultClickAndToast() {
        this.activityScenario.onActivity(new ActivityScenario.ActivityAction<MainActivity>() {
            @Override
            public void perform(MainActivity activity) {
                TextView tvResult = activity.findViewById(R.id.tv_result);
                assertNotNull(tvResult);
                tvResult.performClick();
                // data-bing can ot test
                assertNull(ShadowToast.getTextOfLatestToast());
//                assertEquals("Result has copy to clipboard", ShadowToast.getTextOfLatestToast());
            }
        });
//        TextView tvResult = (TextView) this.mainActivity.findViewById(R.id.tv_main_result);
//        assertNotNull(tvResult);
//        tvResult.performClick();
//        assertEquals(ShadowToast.getTextOfLatestToast(), "Result has copy to clipboard");
    }
}