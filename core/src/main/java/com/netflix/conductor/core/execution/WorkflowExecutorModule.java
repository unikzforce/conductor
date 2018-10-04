package com.netflix.conductor.core.execution;

import com.google.inject.AbstractModule;

/**
 * Conductor hook for dummy listener
 * Exists to customize in nester projects
 */
public class WorkflowExecutorModule extends AbstractModule {
    @Override
    protected void configure() {
        bind(WorkflowStatusListener.class).to(MockWorkflowStatusListenerImpl.class);
    }
}
